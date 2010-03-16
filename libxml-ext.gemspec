# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libxml-ext}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = %q{2010-03-16}
  s.description = %q{LibXML extensions}
  s.email = %q{jens.wille@uni-koeln.de}
  s.extra_rdoc_files = ["COPYING", "ChangeLog", "README"]
  s.files = ["lib/libxml/ext/find.rb", "lib/libxml/ext/namespaces_mixin.rb", "lib/libxml/ext/version.rb", "lib/libxml/ext/find_mixin.rb", "lib/libxml/ext/uniq_mixin.rb", "lib/libxml/ext/namespaces.rb", "lib/libxml/ext/string.rb", "lib/libxml/ext/uniq.rb", "lib/libxml/ext.rb", "README", "ChangeLog", "Rakefile", "COPYING", "spec/libxml/ext_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/blackwinter/libxml-ext}
  s.rdoc_options = ["--charset", "UTF-8", "--title", "libxml-ext Application documentation", "--main", "README", "--line-numbers", "--inline-source", "--all"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{LibXML extensions}

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
