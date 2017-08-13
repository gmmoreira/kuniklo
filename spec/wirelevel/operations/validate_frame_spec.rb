require 'spec_helper'

RSpec.describe Wirelevel::Operations::ValidateFrame do
  let(:frame) { double }
  let(:frame_end) { "\xCE".b }
  let(:type) { 1 }

  before do
    allow(frame).to receive(:end).and_return(frame_end)
    allow(frame).to receive(:type).and_return(type)
  end

  subject { described_class.new.call(frame) }

  context 'with invalid frame-end' do
    let(:frame_end) { "\xAA".b }

    it { is_expected.to be_failure }
    it { expect(subject.value).to be_kind_of(Wirelevel::Errors::InvalidFrameEnd) }
  end

  context 'with invalid frame-type' do
    let(:type) { 5 }

    it { is_expected.to be_failure }
    it { expect(subject.value).to be_kind_of(Wirelevel::Errors::InvalidFrameType) }
  end
end
