class Wirelevel::Frame < Dry::Struct
  constructor_type :schema

  attribute :type, Types::Int
  attribute :channel, Types::Int
  attribute :size, Types::Int
  attribute :payload, Types::String
end
