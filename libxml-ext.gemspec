# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "libxml-ext"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = "2013-07-15"
  s.description = "LibXML extensions"
  s.email = "jens.wille@gmail.com"
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/libxml/ext.rb", "lib/libxml/ext/default_prefix.rb", "lib/libxml/ext/find.rb", "lib/libxml/ext/find_mixin.rb", "lib/libxml/ext/string.rb", "lib/libxml/ext/uniq.rb", "lib/libxml/ext/uniq_mixin.rb", "lib/libxml/ext/version.rb", "COPYING", "ChangeLog", "README", "Rakefile", "spec/hamlet.xml", "spec/libxml/ext_spec.rb", "spec/play.dtd", "spec/spec.opts", "spec/spec_helper.rb"]
  s.homepage = "http://github.com/blackwinter/libxml-ext"
  s.licenses = ["AGPL"]
  s.rdoc_options = ["--charset", "UTF-8", "--line-numbers", "--all", "--title", "libxml-ext Application documentation (v0.4.1)", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.5"
  s.summary = "LibXML extensions"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<libxml-ruby>, [">= 0.9.3"])
    else
      s.add_dependency(%q<libxml-ruby>, [">= 0.9.3"])
    end
  else
    s.add_dependency(%q<libxml-ruby>, [">= 0.9.3"])
  end
end
