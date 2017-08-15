# frozen_string_literal: true

class Wirelevel::Operations::CreateSocket
  include Transaction::Operation

  def call(settings = Settings)
    Try() do
      Socket.tcp settings.host, settings.port
    end
      .to_either
      .fmap ->(socket) { Wirelevel::Socket.new(socket) }
  end

  Container.register('wirelevel.operations.create_socket') do
    new
  end
end
