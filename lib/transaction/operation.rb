module Transaction::Operation
  include Dry::Transaction::Operation
  include Dry::Monads::Try::Mixin
end
