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
    module Namespaces

  def namespaces
    @namespaces ||= self.class::DEFAULT_NAMESPACES
  end

  def namespaces=(ns)
    if url
      @namespaces = self.class.namespaces[url] = ns
    else
      raise "can't set namespaces (document has no URL)"
    end
  end

  def self.included(base)
    base.const_set(:DEFAULT_NAMESPACES, [])

    # container for XML::Node's access to its document's namespaces
    base.instance_variable_set(
      :@namespaces, Hash.new(base.const_get(:DEFAULT_NAMESPACES))
    )

    class << base; attr_reader :namespaces; end

    # overwrite original methods
    instance_methods.each { |method|
      base.send(:define_method, method, instance_method(method))
    }
  end

    end
  end
end

[LibXML::XML::Document].each { |klass|
  klass.send :include, LibXML::Ext::Namespaces
}

class LibXML::XML::Node

  def namespaces
    @namespaces ||= LibXML::XML::Document.namespaces[doc.url]
  end

  def namespaces=(ns)
    @namespaces = ns
  end

end
