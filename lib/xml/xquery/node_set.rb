#--
###############################################################################
#                                                                             #
# A component of ruby-xquery, mimicking XQuery in Ruby.                       #
#                                                                             #
# Copyright (C) 2007 Jens Wille                                               #
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

module XML::XQuery

  module NodeSet

    # Object#dup gives a segmentation fault on #to_a (via Enumerable)!!
    def dup
      xpath.set
    end

    def uniq
      dup.uniq!
    end

    def uniq!
      # return unique when asked for array
      @to_a = to_a.uniq

      def self.to_a
        @to_a
      end

      # forward to unique array
      def self.each(&block)
        @to_a.each(&block)
      end
      def self.length
        @to_a.length
      end
      def self.size
        @to_a.size
      end

      self
    end

    def contents
      map { |i|
        i.content
      }
    end

    def to_s
      contents.join(' | ')
    end

  end

end

class XML::Node::Set
  include XML::XQuery::NodeSet
end
