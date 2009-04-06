#--
###############################################################################
#                                                                             #
# A component of ruby-xquery, mimicking XQuery in Ruby.                       #
#                                                                             #
# Copyright (C) 2007-2009 Jens Wille                                          #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@uni-koeln.de>                                    #
#                                                                             #
# ruby-xquery is free software; you can redistribute it and/or modify it      #
# under the terms of the GNU General Public License as published by the Free  #
# Software Foundation; either version 3 of the License, or (at your option)   #
# any later version.                                                          #
#                                                                             #
# ruby-xquery is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or       #
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for    #
# more details.                                                               #
#                                                                             #
# You should have received a copy of the GNU General Public License along     #
# with ruby-xquery. If not, see <http://www.gnu.org/licenses/>.               #
#                                                                             #
###############################################################################
#++

require 'forwardable'

module LibXML::XML::XQuery::Uniqueness

  extend Forwardable

  DELEGATORS = %w[to_a each length size]

  def_delegators *DELEGATORS

  def to_a
    if @_uniq
      # return unique nodes according to their #to_s
      seen = Hash.new { |h, k| h[k] = true; false }
      uniq = []

      _xquery_original_to_a.each { |n|
        uniq << n unless seen[n.to_s]
      }

      uniq
    else
      _xquery_original_to_a
    end
  end

  def uniq
    proxy = self.class.new.uniq!
    proxy.instance_variable_set(:@_this, self)

    class << proxy
      (instance_methods.map { |m| m.to_s } - DELEGATORS).each { |method|
        undef_method(method) unless method =~ /\A__/ || method == 'object_id'
      }

      def method_missing(*args)
        block_given? ? @_this.send(*args) { |a| yield a } : @_this.send(*args)
      end
    end

    proxy
  end

  def uniq!
    @_uniq = true
    self
  end

  def uniq?
    @_uniq
  end

  def self.included(base)
    base.send(:alias_method, :_xquery_original_to_a, :to_a)

    # overwrite original methods
    instance_methods.each { |method|
      base.send(:define_method, method, instance_method(method))
    }
  end

end

[LibXML::XML::XPath::Object].each { |klass|
  klass.send :include, LibXML::XML::XQuery::Uniqueness
}
