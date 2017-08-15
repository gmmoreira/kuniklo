# frozen_string_literal: true

module Wirelevel
  module Operations
    class DecodeShortString
      include Transaction::Operation

      def call(data)
        Right(data.unpack('Ca*')).fmap do |(size, data)|
          data.unpack("a#{size}a*")
        end
      end

      Container.register('wirelevel.operations.decode_short_string') do
        new
      end
    end
  end
end
