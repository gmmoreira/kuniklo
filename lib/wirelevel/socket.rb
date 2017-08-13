class Wirelevel::Socket
  attr_reader :socket
  attr_reader :buffer

  def initialize(socket)
    @socket = socket
    @buffer = ""
  end

  def read(length = 8)
    socket.recv(length).tap do |data|
      buffer << data
    end
  end

  def write(data)
    socket.send(data, 0)
  end

  def close

  end
end
