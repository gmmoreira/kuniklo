# frozen_string_literal: true

module Wirelevel
  module Operations
    class DecodeBoolean
      include Transaction::Operation

      def call(data)
        Right(data.unpack('Ca*')).fmap do |(value, data)|
          [value != 0, data]
        end
      end

      Container.register('wirelevel.operations.decode_boolean') do
        new
      end
    end
  end
end
