# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::ConnectionStart do
  subject { Container['wirelevel.connection.methods.start'].call(socket) }

  context 'from fixture' do
    let(:data) { read_fixture('connection_start.bin') }
    let(:socket) { instance_double(Wirelevel::Socket) }

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
