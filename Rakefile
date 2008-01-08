begin
  require 'hen'
rescue LoadError
  abort "Please install the 'hen' gem first."
end

require 'lib/xml/xquery/version'

Hen.lay! {{
  :rubyforge => {
    :package => 'ruby-xquery'
  },

  :gem => {
    :version     => XML::XQuery::VERSION,
    :summary     => "Libxml's XPath support + plain ol' Ruby = XQuery (kind of... ;-)",
    :files       => FileList['lib/**/*.rb'].to_a,
    :extra_files => FileList['[A-Z]*', 'specs/*.rb', 'test_data/*'].to_a
  }
}}
