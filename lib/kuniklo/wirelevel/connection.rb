# frozen_string_literal: true

module Wirelevel
  class Connection
    include Import['wirelevel.connection.methods.start']

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
