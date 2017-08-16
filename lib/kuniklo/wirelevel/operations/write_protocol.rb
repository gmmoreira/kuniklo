# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class Wirelevel::Operations::WriteProtocol
        include Transaction::Operation

        PROTOCOL = "AMQP\x0\x0\x9\x1"

        def call(socket)
          Try() do
            socket.write(PROTOCOL)
            socket
          end.to_either
        end
      end
    end
  end
end
