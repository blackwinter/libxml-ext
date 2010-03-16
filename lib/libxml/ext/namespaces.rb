require 'libxml'
require 'libxml/ext/namespaces_mixin'

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
