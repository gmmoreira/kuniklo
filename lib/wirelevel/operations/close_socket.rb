# frozen_string_literal: true

class Wirelevel::Operations::CloseSocket
  include Transaction::Operation

  def call(socket)
    Try() do
      socket.close
    end
  end
end

Container.register('wirelevel.operations.close_socket') do
  Wirelevel::Operations::CloseSocket.new
end
