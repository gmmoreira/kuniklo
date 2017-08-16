# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class ReadSocket
        include Transaction::Operation

        MAXLEN = 2**16

        def call(socket, maxlen = MAXLEN)
          Try() do
            socket.tap { |s| s.read(maxlen) }
          end.to_either
        end
      end
    end
  end
end
