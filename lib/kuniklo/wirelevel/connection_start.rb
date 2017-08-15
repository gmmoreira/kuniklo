# frozen_string_literal: true

module Wirelevel
  class ConnectionStart
    include Transaction

    step :read_frame, with: 'wirelevel.operations.read_frame'
    step :decode_method, with: 'wirelevel.operations.decode_method'
    step :decode_start, with: 'wirelevel.operations.connection.decode_start'

    Container.register('wirelevel.connection_start') do
      new
    end
  end
end
