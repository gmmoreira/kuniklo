# frozen_string_literal: true

module Types
  include Dry::Types.module

  # Frame
  MethodFrameType = Int.constrained(eql: 1)
  HeaderFrameType = Int.constrained(eql: 2)
  BodyFrameType = Int.constrained(eql: 3)
  HeartbeatFrameType = Int.constrained(eql: 8)
  FrameType = MethodFrameType | HeaderFrameType | BodyFrameType | HeartbeatFrameType

  FrameChannel = Int.constrained(included_in: 0..65_535)
  FrameEnd = String.constrained(eql: "\xCE".b)
end
