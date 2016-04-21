require_relative 'lib/libxml/ext/version'

begin
  require 'hen'

  Hen.lay! {{
    gem: {
      name:         %q{libxml-ext},
      version:      LibXML::Ext::VERSION,
      summary:      %q{LibXML extensions},
      author:       %q{Jens Wille},
      email:        %q{jens.wille@gmail.com},
      license:      %q{AGPL-3.0},
      homepage:     :blackwinter,
      dependencies: { 'libxml-ruby' => '>= 0.9.3' },

      required_ruby_version: '>= 1.9.3'
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end
