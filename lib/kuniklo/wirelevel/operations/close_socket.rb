# frozen_string_literal: true

module Kuniklo
  class Wirelevel::Operations::CloseSocket
    include Transaction::Operation

    def call(socket)
      Try() do
        socket.close
      end.to_either
    end
  end
end
