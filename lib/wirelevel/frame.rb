class Wirelevel::Frame < Dry::Struct
  constructor_type :strict

  attribute :type, Types::Int
  attribute :channel, Types::Int
  attribute :size, Types::Int
  attribute :payload, Types::String
  attribute :end, Types::String
end
