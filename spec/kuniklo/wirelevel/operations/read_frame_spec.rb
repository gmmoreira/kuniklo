# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::Operations::ReadFrame do
  let(:socket) { double }

  before do
    allow(socket).to receive(:buffer).and_return(data)
  end

  subject { described_class.new.call(socket) }

  context 'valid frame' do
    let(:data) do
      "\x01" \
        "\x00\x00" \
        "\x00\x00\x00\x04" \
        'AMQP' +
        "\xCE".b
    end

    it { is_expected.to be_success }
    it { expect(subject.value.type).to eq 1 }
    it { expect(subject.value.channel).to eq 0 }
    it { expect(subject.value.size).to eq 4 }
    it { expect(subject.value.payload).to eq 'AMQP' }
    it { expect(subject.value.end).to eq "\xCE".b }
  end
end
