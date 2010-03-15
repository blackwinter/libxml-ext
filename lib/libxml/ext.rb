#--
###############################################################################
#                                                                             #
# ruby-xquery -- Libxml's XPath support + plain ol' Ruby = XQuery (kind of... #
# ;-)                                                                         #
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

begin
  require 'rubygems'
rescue LoadError
end

require 'libxml'

raise "need libxml-ruby version >= 0.9.3, got #{LibXML::XML::VERSION}" \
  unless LibXML::XML::VERSION >= '0.9.3'

# Libxml's XPath support + plain ol' Ruby = XQuery (kind of... ;-)

module LibXML::XML::XQuery
end

Dir[File.join(File.dirname(__FILE__), 'xquery', '**', '*.rb')].each { |rb|
  require rb
}
