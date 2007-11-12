require 'lib/xml/xquery/version'

FILES = FileList['lib/**/*.rb'].to_a
RDOCS = %w[README COPYING ChangeLog]
OTHER = FileList['[A-Z]*', 'specs/*.rb', 'test_data/*'].to_a

task(:doc_spec) {{
  :title      => 'ruby-xquery Application documentation',
  :rdoc_files => RDOCS + FILES
}}

task(:gem_spec) {{
  :name             => 'ruby-xquery',
  :version          => XML::XQuery::VERSION,
  :summary          => "Libxml's XPath support + plain ol' Ruby = XQuery (kind of... ;-)",
  :files            => FILES + OTHER,
  :require_path     => 'lib',
  :extra_rdoc_files => RDOCS
}}
