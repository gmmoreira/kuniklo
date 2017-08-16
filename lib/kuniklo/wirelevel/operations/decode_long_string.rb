# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class DecodeLongString
        include Transaction::Operation

        def call(data)
          Right(data.unpack('Na*')).fmap do |size, data|
            data.unpack("a#{size}a*")
          end
        end
      end
    end
  end
end
