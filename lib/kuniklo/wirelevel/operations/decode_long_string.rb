# frozen_string_literal: true

module Wirelevel
  module Operations
    class DecodeLongString
      include Transaction::Operation

      def call(data)
        Right(data.unpack('Na*')).fmap do |size, data|
          data.unpack("a#{size}a*")
        end
      end

      Container.register('wirelevel.operations.decode_long_string') do
        new
      end
    end
  end
end
