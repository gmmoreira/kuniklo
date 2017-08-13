class Wirelevel::Operations::WriteProtocol
  include Transaction::Operation

  PROTOCOL = "AMQP\x0\x0\x9\x1".freeze

  def call(socket)
    Try() do
      socket.write(PROTOCOL)
      socket
    end.to_either
  end
end

Container.register('wirelevel.operations.write_protocol') do
  Wirelevel::Operations::WriteProtocol.new
end
