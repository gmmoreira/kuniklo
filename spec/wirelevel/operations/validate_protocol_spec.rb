# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::Operations::ValidateProtocol do
  let(:socket) { instance_double(Wirelevel::Socket) }

  subject { described_class.new.call(socket) }

  context 'when valid protocol' do
    before do
      allow(socket).to receive(:buffer).and_return(read_fixture('connection_open.bin'))
    end

    it { is_expected.to be_success }
    it { expect(subject.value).to be socket }
  end

  context 'when invalid protocol, server returns a support protocol' do
    before do
      allow(socket).to receive(:buffer).and_return("AMQP\x0\x0\x9\x1")
    end

    it { is_expected.to be_failure }
    it { expect(subject.value).to be socket }
  end
end
