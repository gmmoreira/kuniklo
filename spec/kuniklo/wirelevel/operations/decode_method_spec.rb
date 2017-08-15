# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::Operations::DecodeMethod do
  let(:data) { read_fixture('connection_start.bin').b }
  let(:socket) { instance_double(Wirelevel::Socket) }
  let(:frame) { Container['wirelevel.operations.read_frame'].call(socket).value }

  before do
    allow(socket).to receive(:buffer).and_return(data)
  end

  subject { Container['wirelevel.operations.decode_method'].call(frame) }

  it { is_expected.to be_success }
end
