begin
  require 'hen'
rescue LoadError
  abort "Please install the 'hen' gem first."
end

require 'lib/libxml/xquery/version'

Hen.lay! {{
  :rubyforge => {
    :package => 'ruby-xquery'
  },

  :gem => {
    :version      => LibXML::XML::XQuery::VERSION,
    :summary      => "Libxml's XPath support + plain ol' Ruby = XQuery (kind of... ;-)",
    :files        => FileList['lib/**/*.rb'].to_a,
    :extra_files  => FileList['[A-Z]*', 'specs/**/*.rb', 'test_data/**/*'].to_a,
    :dependencies => [['libxml-ruby', '>= 0.9.3']]
  }
}}
