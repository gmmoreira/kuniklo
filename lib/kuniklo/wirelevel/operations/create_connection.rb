# frozen_string_literal: true

module Wirelevel
  module Operations
    class CreateConnection
      include Transaction::Operation

      def call(socket)
        Right(Wirelevel::Connection.new(socket))
      end

      Container.register('wirelevel.operations.create_connection') do
        new
      end
    end
  end
end
