# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'Kuniklo'
  s.version     = '0.0.0'
  s.licenses    = ['MIT']
  s.summary     = 'AMQP Client'
  s.description = 'AMQP 0.9.1 Client'
  s.authors     = ['Guilherme Maganha Moreira']
  s.email       = 'guilhermerx7@gmail.com'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) } - ['bin/console']
  s.homepage    = 'https://github.com/gmmoreira/kuniklo'

  s.add_runtime_dependency 'dry-auto_inject', '~> 0.4.0'
  s.add_runtime_dependency 'dry-monads', '~> 0.3.0'
  s.add_runtime_dependency 'dry-struct', '~> 0.3.0'
  s.add_runtime_dependency 'dry-transaction', '~> 0.10.0'
  s.add_runtime_dependency 'dry-types', '~> 0.11.0'
  s.add_runtime_dependency 'settingslogic', '~> 2.0.0'

  s.add_development_dependency 'bundler', '= 1.15.3'
  s.add_development_dependency 'guard-rspec', '~> 4.7.0'
  s.add_development_dependency 'pry', '~> 0.10.0'
  s.add_development_dependency 'rspec', '~> 3.6.0'
  s.add_development_dependency 'rspec-its', '~> 1.2.0'
  s.add_development_dependency 'rubocop', '~> 0.49.0'
  s.add_development_dependency 'simplecov', '~> 0.14.0'
end
