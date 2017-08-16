# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    class Connection
      module Methods
        class Start
          include Transaction

          step :read_frame, with: 'kuniklo.wirelevel.operations.read_frame'
          step :decode_method, with: 'kuniklo.wirelevel.operations.decode_method'
          step :decode_start, with: 'kuniklo.wirelevel.operations.connection.decode_start'
        end
      end
    end
  end
end
