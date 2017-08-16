# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class CreateConnection
        include Transaction::Operation

        def call(socket)
          Right(Wirelevel::Connection.new(socket))
        end
      end
    end
  end
end
