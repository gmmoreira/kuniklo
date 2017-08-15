# frozen_string_literal: true

module Wirelevel
  module Operations
    class DecodeFieldTable
      include Transaction::Operation
      include Import['wirelevel.operations.field_value_matcher',
                     'wirelevel.operations.decode_short_string']

      def call(data)
        result = {}
        Right(data.unpack('Na*')).fmap do |size, table_data|
          count = 0

          begin
            pair = decode_field_value_pair(table_data)
            name, value, table_data, consumed_size = pair.value
            result[name] = value
            count += consumed_size
          end while count < size

          [result, table_data]
        end
      end

      def decode_field_value_pair(list)
        initial_size = list.b.size

        decode_short_string.call(list).bind do |field_name, field_data|
          field_value_matcher.call(field_data).fmap do |decoder, data|
            decoder.call(data).bind do |field_value, data|
              [field_name, field_value, data, initial_size - data.b.size]
            end
          end
        end
      end

      Container.register('wirelevel.operations.decode_field_table') do
        new
      end
    end
  end
end
