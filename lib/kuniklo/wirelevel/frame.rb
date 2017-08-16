# frozen_string_literal: true

module Kuniklo
  module Wirelevel
    class Frame < Dry::Struct
      constructor_type :strict

      attribute :type, Types::FrameType
      attribute :channel, Types::FrameChannel
      attribute :size, Types::Int
      attribute :payload, Types::String
      attribute :end, Types::FrameEnd
    end
  end
end
