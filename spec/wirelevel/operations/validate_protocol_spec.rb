require 'spec_helper'

RSpec.describe Wirelevel::Operations::ValidateProtocol do
  let(:socket) { double }

  subject { described_class.new.call(socket) }

  context 'when valid protocol' do
    before do
      allow(socket).to receive(:read).and_return("")
    end

    it { is_expected.to be_success }
    it { expect(subject.value).to be socket }
  end

  context 'when invalid protocol' do
    before do
      allow(socket).to receive(:read).and_return("AMQP\x0\x0\x9\x1")
    end

    it { is_expected.to be_failure }
    it { expect(subject.value).to be socket }
  end
end
