# frozen_string_literal: true

klass = class Wirelevel::Operations::ReadSocket
          include Transaction::Operation

          MAXLEN = 2**16

          def call(socket, maxlen = MAXLEN)
            Try() do
              socket.tap { |s| s.read(maxlen) }
            end.to_either
          end

          Container.register('wirelevel.operations.read_socket') do
            new
          end
end
