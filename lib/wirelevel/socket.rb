# frozen_string_literal: true

require 'forwardable'

class Wirelevel::Socket
  extend Forwardable

  attr_reader :socket
  attr_reader :buffer

  def_delegator :@socket, :close

  def initialize(socket)
    @socket = socket
    @buffer = ''
  end

  def read(maxlen, *options)
    @buffer = socket.recv(maxlen, *options)
  end

  def write(data)
    socket.send(data, 0)
  end
end
