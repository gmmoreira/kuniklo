# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      module Connection
        class DecodeStart
          include Transaction::Operation
          include Import['kuniklo.wirelevel.operations.decode_field_table',
                         'kuniklo.wirelevel.operations.decode_long_string']

          def call(method)
            Right(method.arguments)
              .fmap { |arguments| arguments.unpack('cca*') }
              .bind do |version_major, version_minor, arguments|

              decode_field_table.call(arguments).bind do |server_properties, data|
                decode_long_string.call(data).bind do |mechanisms, data|
                  decode_long_string.call(data).fmap do |locales, _data|
                    Wirelevel::Connection::Start.new(version_major: version_major,
                                                     version_minor: version_minor,
                                                     server_properties: server_properties,
                                                     mechanisms: mechanisms,
                                                     locales: locales)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
