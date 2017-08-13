require 'spec_helper'

RSpec.describe Wirelevel::Operations::ReadFrame do
  let(:socket) { double }

  before do
    allow(socket).to receive(:buffer).and_return(data)
  end

  subject { described_class.new.call(socket) }

  context 'valid frame' do
    let(:data) { read_fixture('connection_open.bin') }

    it { is_expected.to be_success }
    it { expect(subject.value.type).to eq 1 }
    it { expect(subject.value.channel).to eq 0 }
    it { expect(subject.value.size).to eq 486 }
  end

  context 'invalid frame-end' do
    let(:data) do
      "\x01" +
        "\x00\x00" +
        "\x00\x00\x00\x04" +
        "AMQP" +
        "\xAA" # correct frame-end is xCE
    end

    it { is_expected.to be_failure }
    it { expect(subject.value).to be_kind_of(Wirelevel::Errors::InvalidFrameEnd) }
  end
end
