# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    class Connection
      include Import['kuniklo.wirelevel.connection.methods.start']

      attr_reader :socket

      def initialize(socket, deps)
        super(deps)

        @socket = socket
      end

      def start
        super.call(socket)
      end
    end
  end
end
