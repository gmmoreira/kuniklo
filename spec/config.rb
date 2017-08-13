# frozen_string_literal: true

require 'settingslogic'

class Settings < Settingslogic
  source File.expand_path('../config.yml', __FILE__)
  namespace ENV['AMQP'] || 'rabbitmq'
end
