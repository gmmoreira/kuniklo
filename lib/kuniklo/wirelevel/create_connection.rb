# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    class CreateConnection
      include Transaction

      step :create_socket, with: 'kuniklo.wirelevel.operations.create_socket'
      step :write_protocol, with: 'kuniklo.wirelevel.operations.write_protocol'
      step :read_socket, with: 'kuniklo.wirelevel.operations.read_socket'
      step :validate_protocol, with: 'kuniklo.wirelevel.operations.validate_protocol'
      step :create_connection, with: 'kuniklo.wirelevel.operations.create_connection'
    end
  end
end
