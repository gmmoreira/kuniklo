require 'spec_helper'

RSpec.describe Wirelevel::Operations::Connection::DecodeStart do
  subject { Container['wirelevel.operations.connection.decode_start'].call(method.value) }

  describe 'from fixture' do
    let(:socket) { instance_double(Wirelevel::Socket) }
    let(:data) { read_fixture('connection_start.bin') }
    let(:frame) { Container['wirelevel.operations.read_frame'].call(socket) }
    let(:method) { Container['wirelevel.operations.decode_method'].call(frame.value) }

    before do
      allow(socket).to receive(:buffer).and_return(data)
    end

    it { is_expected.to be_success }
    its('value.version_major') { is_expected.to eq 0 }
    its('value.version_minor') { is_expected.to eq 9 }
    its('value.mechanisms') { is_expected.to eq 'AMQPLAIN PLAIN' }
    its('value.locales') { is_expected.to eq 'en_US' }
  end
end
