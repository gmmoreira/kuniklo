# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class FieldValueMatcher
        include Transaction::Operation

        FIELD_TABLE = Dry::Matcher::Case.new(
          match: ->(field) { field == 'F' }
        )

        FIELD_BOOLEAN = Dry::Matcher::Case.new(
          match: ->(field) { field == 't' }
        )

        FIELD_LONG_STRING = Dry::Matcher::Case.new(
          match: ->(field) { field == 'S' }
        )

        def call(data)
          matcher = Dry::Matcher.new(table: FIELD_TABLE,
                                     boolean: FIELD_BOOLEAN,
                                     long_string: FIELD_LONG_STRING)

          Right(data.unpack('aa*')).bind do |field, data|
            Maybe(field).fmap do
              matcher.call(field) do |m|
                m.table { Container['kuniklo.wirelevel.operations.decode_field_table'] }
                m.boolean { Container['kuniklo.wirelevel.operations.decode_boolean'] }
                m.long_string { Container['kuniklo.wirelevel.operations.decode_long_string'] }
              end
            end.bind { |decoder| Right([decoder, data]) }.or(Left([nil, data]))
          end
        end
      end
    end
  end
end
