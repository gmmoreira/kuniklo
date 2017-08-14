# frozen_string_literal: true

class Wirelevel::CreateConnection
  include Transaction

  step :create_socket, with: 'wirelevel.operations.create_socket'
  step :write_protocol, with: 'wirelevel.operations.write_protocol'
  step :read_socket, with: 'wirelevel.operations.read_socket'
  step :validate_protocol, with: 'wirelevel.operations.validate_protocol'
  step :create_connection, with: 'wirelevel.operations.create_connection'
end
