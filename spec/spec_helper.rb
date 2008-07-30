BASE = File.join(File.dirname(__FILE__), '..') unless Object.const_defined?(:BASE)

$: << File.join(BASE, 'lib')

require 'libxml/xquery'

DOC = LibXML::XML::Document.file(File.join(BASE, 'test_data', 'hamlet.xml')) unless Object.const_defined?(:DOC)
