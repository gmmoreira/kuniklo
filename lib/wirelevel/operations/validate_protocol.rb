class Wirelevel::Operations::ValidateProtocol
  include Transaction::Operation

  def call(socket)
    Try() do
      socket.read
    end.to_either.bind do |data|
      if data.bytes == "AMQP\x0\x0\x9\x1".bytes
        Left(socket)
      else
        Right(socket)
      end
    end
  end
end

Container.register('wirelevel.operations.validate_protocol') do
  Wirelevel::Operations::ValidateProtocol.new
end
