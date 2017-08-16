# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    module Operations
      class DecodeMethod
        include Transaction::Operation

        def call(frame)
          Right(frame.payload).bind do |payload|
            class_id, method_id, arguments = payload.unpack('nna*')

            Right(Wirelevel::Method.new(class_id: class_id, method_id: method_id, arguments: arguments))
          end
        end
      end
    end
  end
end
