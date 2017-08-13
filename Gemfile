# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'dry-auto_inject'
gem 'dry-monads'
gem 'dry-struct'
gem 'dry-transaction'
gem 'pry'
gem 'settingslogic'

group :development, :test do
  gem 'rspec'
end

group :test do
  gem 'simplecov', require: false
end

group :development do
  gem 'guard-rspec', require: false
  gem 'rubocop', require: false
  gem 'guard-rubocop', require: false
end
