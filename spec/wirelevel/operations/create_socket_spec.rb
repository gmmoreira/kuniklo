require 'spec_helper'

RSpec.describe Wirelevel::Operations::CreateSocket do
  context 'when TCP socket is open successfully' do
    let(:socket) { double }

    before do
      expect(Socket).to receive(:tcp).and_return(socket)
    end

    it { expect(subject.call).to be_success }
    it { expect(subject.call.value).to be_kind_of(Wirelevel::Socket) }
  end

  context 'when TCP socket throw error' do
    before do
      expect(Socket).to receive(:tcp).and_raise(IOError)
    end

    it { expect(subject.call).to be_failure }
    it { expect(subject.call.value).to be_kind_of IOError }
  end
end
