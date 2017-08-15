# frozen_string_literal: true

module Wirelevel
  class Method < Dry::Struct
    constructor_type :strict

    attribute :class_id, Types::Int
    attribute :method_id, Types::Int
    attribute :arguments, Types::String
  end
end
