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

require 'xml/xquery/enhanced_find'

module XML::XQuery

  module Node

    include XML::XQuery::EnhancedFind

    def to_s
      content
    end

    def self.included(base)
      # overwrite original "property reader"
      base.send(:define_method, :[], instance_method(:[]))
    end

  end

end

class XML::Node
  include XML::XQuery::Node
end
