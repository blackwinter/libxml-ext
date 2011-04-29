# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libxml-ext}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = %q{2011-04-29}
  s.description = %q{LibXML extensions}
  s.email = %q{jens.wille@uni-koeln.de}
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/libxml/ext/find.rb", "lib/libxml/ext/version.rb", "lib/libxml/ext/find_mixin.rb", "lib/libxml/ext/uniq_mixin.rb", "lib/libxml/ext/string.rb", "lib/libxml/ext/default_prefix.rb", "lib/libxml/ext/uniq.rb", "lib/libxml/ext.rb", "README", "ChangeLog", "Rakefile", "COPYING", "spec/spec.opts", "spec/play.dtd", "spec/libxml/ext_spec.rb", "spec/hamlet.xml", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/blackwinter/libxml-ext}
  s.rdoc_options = ["--charset", "UTF-8", "--title", "libxml-ext Application documentation (v0.4.1)", "--main", "README", "--line-numbers", "--all"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{LibXML extensions}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<libxml-ruby>, [">= 0.9.3"])
    else
      s.add_dependency(%q<libxml-ruby>, [">= 0.9.3"])
    end
  else
    s.add_dependency(%q<libxml-ruby>, [">= 0.9.3"])
  end
end
