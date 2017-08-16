# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class DecodeShortString
        include Transaction::Operation

        def call(data)
          Right(data.unpack('Ca*')).fmap do |(size, data)|
            data.unpack("a#{size}a*")
          end
        end
      end
    end
  end
end
