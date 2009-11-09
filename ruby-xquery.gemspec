# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-xquery}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = %q{2009-11-09}
  s.description = %q{Libxml's XPath support + plain ol' Ruby = XQuery (kind of... ;-)}
  s.email = %q{jens.wille@uni-koeln.de}
  s.extra_rdoc_files = ["COPYING", "ChangeLog", "README"]
  s.files = ["lib/xml/xquery.rb", "lib/libxml/xquery/uniqueness.rb", "lib/libxml/xquery/namespaces.rb", "lib/libxml/xquery/version.rb", "lib/libxml/xquery/string_representation.rb", "lib/libxml/xquery/enhanced_find.rb", "lib/libxml/xquery.rb", "Rakefile", "HEADER", "COPYING", "ChangeLog", "README", "spec/spec_helper.rb", "spec/xquery_spec.rb", "test_data/hamlet.xml", "test_data/play.dtd"]
  s.homepage = %q{http://prometheus.rubyforge.org/ruby-xquery}
  s.rdoc_options = ["--inline-source", "--charset", "UTF-8", "--main", "README", "--line-numbers", "--all", "--title", "ruby-xquery Application documentation"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{prometheus}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Libxml's XPath support + plain ol' Ruby = XQuery (kind of... ;-)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<libxml-ruby>, [">= 0.9.3"])
    else
      s.add_dependency(%q<libxml-ruby>, [">= 0.9.3"])
    end
  else
    s.add_dependency(%q<libxml-ruby>, [">= 0.9.3"])
  end
end
