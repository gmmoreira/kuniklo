# frozen_string_literal: true

class Wirelevel::Operations::CloseSocket
  include Transaction::Operation

  def call(socket)
    Try() do
      socket.close
    end.to_either
  end

  Container.register('wirelevel.operations.close_socket') do
    self.new
  end
end

