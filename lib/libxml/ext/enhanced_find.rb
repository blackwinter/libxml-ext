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

module LibXML
  module Ext
    module EnhancedFind

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
  end
end

[LibXML::XML::Document, LibXML::XML::Node].each { |klass|
  klass.send :include, LibXML::Ext::EnhancedFind
}
