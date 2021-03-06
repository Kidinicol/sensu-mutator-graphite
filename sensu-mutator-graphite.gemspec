lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require_relative 'lib/sensu-mutator-graphite'

Gem::Specification.new do |s|
  s.authors                = ['Nikoletta Kyriakidou']

  s.date                   = Date.today.to_s
  s.description            = 'This mutator provides filtering Sensu metrics.'
  s.email                  = 'nk8smg@hotmail.com'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w[LICENSE.md README.md CHANGELOG.md]
  s.homepage               = 'https://github.com/Kidinicol/sensu-mutator-graphite'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer'         => 'Nikoletta Kyriakidou',
                               'development_status' => 'active',
                               'production_status'  => 'unstable - testing recommended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-mutator-graphite'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.0.0'
  s.summary                = 'Sensu mutator for sensu'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuMutatorGraphite::Version::VER_STRING

  s.add_runtime_dependency 'sensu-plugin', '~> 1.2'
  s.add_runtime_dependency 'rest-client',       '1.8.0'
  s.add_runtime_dependency 'english',           '0.6.3'

  s.add_development_dependency 'bundler',                   '~> 2.2.10'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
  s.add_development_dependency 'github-markup',             '~> 1.3'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rubocop',                   '~> 0.49.0'
  s.add_development_dependency 'rspec',                     '~> 3.1'
  s.add_development_dependency 'rake',                      '~> 12.3.3'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'yard',                      '~> 0.9.11'
end
