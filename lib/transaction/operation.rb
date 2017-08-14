# frozen_string_literal: true

module Transaction::Operation
  include Dry::Transaction::Operation
  include Dry::Monads::Try::Mixin
  include Dry::Monads::Maybe::Mixin
end
