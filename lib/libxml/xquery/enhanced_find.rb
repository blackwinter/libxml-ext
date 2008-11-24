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

module LibXML::XML::XQuery::EnhancedFind

  def enhanced_find(xpath)
    find(xpath.gsub(/\*\*/, 'descendant::node()'), namespaces)
  end
  alias_method :[], :enhanced_find

  def /(xpath)
    enhanced_find(xpath.to_s)
  end

  def self.included(base)
    # overwrite original methods
    instance_methods.each { |method|
      base.send(:define_method, method, instance_method(method))
    }
  end

end

class LibXML::XML::Document

  include LibXML::XML::XQuery::EnhancedFind

  DEFAULT_NAMESPACES = []

  # container for XML::Node's access to its document's namespaces
  @namespaces = Hash.new(DEFAULT_NAMESPACES)

  class << self; attr_reader :namespaces; end

  def namespaces
    @namespaces ||= DEFAULT_NAMESPACES
  end

  def namespaces=(ns)
    raise "can't set namespaces (document has no URL)" unless url

    @namespaces = self.class.namespaces[url] = ns
  end

end

class LibXML::XML::Node

  include LibXML::XML::XQuery::EnhancedFind

  def namespaces
    LibXML::XML::Document.namespaces[doc.url]
  end

end
