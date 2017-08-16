# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::CloseSocket do
    let(:socket) { double }

    subject { described_class.new.call(socket) }

    context 'when socket is closed successfully' do
      before do
        allow(socket).to receive(:close)
      end

      it { is_expected.to be_success }
    end

    context 'when socket fail to be closed' do
      before do
        allow(socket).to receive(:close).and_raise(IOError)
      end

      it { is_expected.to be_failure }
    end
  end
end
