class Wirelevel::Operations::ValidateFrame
  include Transaction::Operation

  FRAME_END = "\xCE".b.freeze
  ALLOWED_TYPES = [1, 2, 3, 4].freeze

  def call(frame)
    Try() do
      raise Wirelevel::Errors::InvalidFrameEnd.new("Unexpected #{frame.end}") if FRAME_END != frame.end
      raise Wirelevel::Errors::InvalidFrameType.new("Unexpected type #{frame.type}") unless ALLOWED_TYPES.include? frame.type
      frame
    end.to_either
  end
end
