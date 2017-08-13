class Wirelevel::Operations::CreateSocket
  include Transaction::Operation

  def call(settings = Settings)
    Try() do
      Socket.tcp settings.host, settings.port
    end.to_either.fmap -> socket { Wirelevel::Socket.new(socket) }
  end
end

Container.register('wirelevel.operations.create_socket') do
  Wirelevel::Operations::CreateSocket.new
end
