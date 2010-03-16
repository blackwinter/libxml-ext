require 'libxml'
require 'libxml/ext/uniq_mixin'

[LibXML::XML::XPath::Object].each { |klass|
  klass.send :include, LibXML::Ext::Uniq
}
