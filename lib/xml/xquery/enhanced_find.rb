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

  module EnhancedFind

    def enhanced_find(xpath)
      find(xpath.gsub(/\*\*/, 'descendant::node()'))
    end
    alias_method :[], :enhanced_find

    def /(xpath)
      enhanced_find(xpath.to_s)
    end

  end

end
