#--
###############################################################################
#                                                                             #
# A component of ruby-xquery, mimicking XQuery in Ruby.                       #
#                                                                             #
# Copyright (C) 2007-2008 Jens Wille                                          #
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

class LibXML::XML::Node::Set

  extend Forwardable

  def_delegators :to_a, :each, :length, :size

  alias_method :_xquery_original_to_a, :to_a

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
    proxy = LibXML::XML::Node::Set.new.uniq!
    proxy.instance_variable_set(:@_this, self)

    class << proxy
      (instance_methods - %w[to_a each length size]).each { |method|
        undef_method(method) unless method =~ /\A__/
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

  def contents(sep = ' | ')
    map { |n| (c = n.to_s(sep)).empty? ? nil : c }.compact
  end

  def to_s(sep = ' | ')
    contents(sep).join(sep)
  end

end
