# frozen_string_literal: true

class Wirelevel::Operations::WriteProtocol
  include Transaction::Operation

  PROTOCOL = "AMQP\x0\x0\x9\x1"

  def call(socket)
    Try() do
      socket.write(PROTOCOL)
      socket
    end.to_either
  end

  Container.register('wirelevel.operations.write_protocol') do
    new
  end
end
