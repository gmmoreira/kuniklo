require 'spec_helper'

RSpec.describe Wirelevel::Frame do
  describe '#initialize' do
    let(:type) { 1 }
    let(:channel) { 0 }
    let(:size) { 4 }
    let(:payload) { "AMQP".b }
    let(:frame_end) { "\xCE".b }

    subject { described_class.new(type: type, channel: channel,
                                  size: size, payload: payload,
                                  end: frame_end) }

    context 'valid values' do
      it { is_expected.to be_kind_of(described_class) }
    end

    context 'when invalid type' do
      let(:type) { 10 }

      it { expect { subject }.to raise_error(Dry::Struct::Error) }
    end

    context 'when invalid channel' do
      let(:channel) { 100000 }

      it { expect { subject }.to raise_error(Dry::Struct::Error) }
    end

    context 'when invalid frame-end' do
      let(:frame_end) { "\xAA".b }

      it { expect { subject }.to raise_error(Dry::Struct::Error) }
    end
  end
end
