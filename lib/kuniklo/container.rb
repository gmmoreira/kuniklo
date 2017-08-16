# frozen_string_literal: true

module Kuniklo
  class Container < Dry::System::Container
    configure do |config|
      config.auto_register = 'lib'
    end

    load_paths!('lib')
  end
end
