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

require 'forwardable'

module LibXML
  module Ext
    module Uniq

  extend Forwardable

  DELEGATORS = %w[to_a each length size] unless const_defined?(:DELEGATORS)
  def_delegators *DELEGATORS

  def to_a
    ary  = _libxml_ext_original_to_a
    seen = Hash.new { |h, k| h[k] = true; false }

    # return unique nodes according to their #to_s
    @_uniq ? ary.delete_if { |node| seen[node.to_s] } : ary
  end

  def uniq
    proxy = self.class.new.uniq!
    proxy.instance_variable_set(:@_this, self)

    class << proxy
      (instance_methods.map { |m| m.to_s } - DELEGATORS).each { |method|
        undef_method(method) unless method =~ /\A__/ || method == 'object_id'
      }

      def method_missing(*args)
        @_this.send(*args, &block_given? ? Proc.new : nil)
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
