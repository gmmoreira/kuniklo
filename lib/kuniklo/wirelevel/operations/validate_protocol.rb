# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class Wirelevel::Operations::ValidateProtocol
        include Transaction::Operation

        PROTOCOL_RANGE = 0...8

        def call(socket)
          Right(socket.buffer[PROTOCOL_RANGE])
            .bind do |data|
            if data != "AMQP\x0\x0\x9\x1".b
              Right(socket)
            else
              Left(socket)
            end
          end
        end
      end
    end
  end
end
