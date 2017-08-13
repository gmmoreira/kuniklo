class Wirelevel::Operations::ReadFrame
  include Transaction::Operation

  TYPE_RANGE = 0...1
  CHANNEL_RANGE = 1...3
  SIZE_RANGE = 3...7
  FRAME_END = "\xCE".freeze

  def call(socket)
    Try() do
      type = socket.buffer[TYPE_RANGE].unpack('C').first
      channel = socket.buffer[CHANNEL_RANGE].unpack('n').first
      size = socket.buffer[SIZE_RANGE].unpack('N').first
      payload = socket.buffer[payload_range(size)]
      frame_end = socket.buffer[frame_end_range(size)]

      raise Wirelevel::Errors::InvalidFrameEnd.new("Unexpected #{frame_end}") if FRAME_END != frame_end

      Wirelevel::Frame.new(type: type, channel: channel, size: size, payload: payload)
    end.to_either
  end

  def payload_range(size)
    Range.new(7, size + 7, true)
  end

  def frame_end_range(size)
    Range.new(size + 7, size + 8, true)
  end
end

Container.register('wirelevel.operations.read_frame') do
  Wirelevel::Operations::ReadFrame.new
end
