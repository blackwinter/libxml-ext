require 'rubygems'

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'libxml/ext'

unless Object.const_defined?(:DOC)
  DOC = LibXML::XML::Document.file(File.join(File.dirname(__FILE__), 'hamlet.xml'))
end
