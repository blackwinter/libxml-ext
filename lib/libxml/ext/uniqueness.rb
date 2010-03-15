#--
###############################################################################
#                                                                             #
# A component of libxml-ext, the LibXML extensions.                           #
#                                                                             #
# Copyright (C) 2007-2010 Jens Wille                                          #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@uni-koeln.de>                                    #
#                                                                             #
# libxml-ext is free software; you can redistribute it and/or modify it       #
# under the terms of the GNU General Public License as published by the Free  #
# Software Foundation; either version 3 of the License, or (at your option)   #
# any later version.                                                          #
#                                                                             #
# libxml-ext is distributed in the hope that it will be useful, but WITHOUT   #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or       #
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for    #
# more details.                                                               #
#                                                                             #
# You should have received a copy of the GNU General Public License along     #
# with libxml-ext. If not, see <http://www.gnu.org/licenses/>.                #
#                                                                             #
###############################################################################
#++

require 'libxml'
require 'forwardable'

module LibXML
  module Ext
    module Uniqueness

  extend Forwardable

  DELEGATORS = %w[to_a each length size]

  def_delegators *DELEGATORS

  def to_a
    if @_uniq
      # return unique nodes according to their #to_s
      seen = Hash.new { |h, k| h[k] = true; false }
      uniq = []

      _libxml_ext_original_to_a.each { |n|
        uniq << n unless seen[n.to_s]
      }

      uniq
    else
      _libxml_ext_original_to_a
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
    base.send(:alias_method, :_libxml_ext_original_to_a, :to_a)

    # overwrite original methods
    instance_methods.each { |method|
      base.send(:define_method, method, instance_method(method))
    }
  end

    end
  end
end

[LibXML::XML::XPath::Object].each { |klass|
  klass.send :include, LibXML::Ext::Uniqueness
}
