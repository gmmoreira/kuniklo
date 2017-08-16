# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class ReadFrame
        include Transaction::Operation

        HEADER_PATTERN = 'CnN'

        def call(socket)
          Try() do
            type, channel, size = socket.buffer.unpack(HEADER_PATTERN)

            payload, frame_end = socket.buffer.unpack(payload_pattern(size))

            Wirelevel::Frame.new(type: type, channel: channel, size: size, payload: payload, end: frame_end)
          end.to_either
        end

        def payload_pattern(size)
          "x7a#{size}a"
        end
      end
    end
  end
end
