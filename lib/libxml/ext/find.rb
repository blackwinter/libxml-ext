require 'libxml'
require 'libxml/ext/find_mixin'

[LibXML::XML::Document, LibXML::XML::Node].each { |klass|
  klass.send :include, LibXML::Ext::Find
}
