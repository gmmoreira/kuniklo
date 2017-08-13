klass = class Wirelevel::Operations::ReadSocket
  include Transaction::Operation

  MAXLEN = 2 ** 16

  def call(socket, maxlen = MAXLEN)
    Try() do
      socket.tap { |s| s.read(maxlen) }
    end.to_either
  end

  Container.register('wirelevel.operations.read_socket') do
    self.new
  end
end
