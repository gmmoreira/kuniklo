# frozen_string_literal: true

module Wirelevel
  class Connection
    class Start < Dry::Struct
      constructor_type :strict

      attribute :version_major, Types::Int
      attribute :version_minor, Types::Int
      attribute :server_properties, Types::Hash
      attribute :mechanisms, Types::String
      attribute :locales, Types::String
    end
  end
end
