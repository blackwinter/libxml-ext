require %q{lib/libxml/ext/version}

begin
  require 'hen'

  Hen.lay! {{
    :gem => {
      :name         => %q{libxml-ext},
      :version      => LibXML::Ext::VERSION,
      :summary      => %q{LibXML extensions},
      :homepage     => 'http://github.com/blackwinter/libxml-ext',
      :files        => FileList['lib/**/*.rb'].to_a,
      :extra_files  => FileList['[A-Z]*', 'spec/**/*.rb', 'test_data/**/*'].to_a,
      :dependencies => [['libxml-ruby', '>= 0.9.3']]
    }
  }}
rescue LoadError
  abort "Please install the 'hen' gem first."
end

### Place your custom Rake tasks here.
