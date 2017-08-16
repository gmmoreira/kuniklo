# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class DecodeBoolean
        include Transaction::Operation

        def call(data)
          Right(data.unpack('Ca*')).fmap do |(value, data)|
            [value != 0, data]
          end
        end
      end
    end
  end
end
