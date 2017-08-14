module Wirelevel
  class Connection
    include Import['wirelevel.connection_start']

    attr_reader :socket

    def initialize(socket, deps)
      super(deps)

      @socket = socket
    end

    def start
      connection_start.(socket)
    end
  end
end
