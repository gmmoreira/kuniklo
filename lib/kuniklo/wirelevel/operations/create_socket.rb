# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class CreateSocket
        include Transaction::Operation

        def call(settings = Settings)
          Try() do
            ::Socket.tcp settings.host, settings.port
          end.to_either
            .fmap ->(socket) { Wirelevel::Socket.new(socket) }
        end
      end
    end
  end
end
