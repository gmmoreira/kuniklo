require 'spec_helper'

RSpec.describe Wirelevel::Operations::ReadSocket do
  let(:socket) { instance_double(Wirelevel::Socket) }

  subject { described_class.new.call(socket) }

  context 'when read successfully' do
    before do
      expect(socket).to receive(:read).with(2 ** 16)
    end

    it { is_expected.to be_success }
  end

  context 'when read throw Error' do
    before do
      expect(socket).to receive(:read).with(2 ** 16).and_raise(IOError)
    end

    it { is_expected.to be_failure }
    it { expect(subject.value).to be_kind_of(IOError) }
  end
end
