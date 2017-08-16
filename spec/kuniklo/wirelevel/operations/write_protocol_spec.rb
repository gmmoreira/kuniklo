# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::WriteProtocol do
    let(:socket) { double }

    subject { described_class.new.call(socket) }

    context 'on success' do
      before do
        expect(socket).to receive(:write).with("AMQP\x0\x0\x9\x1")
      end

      it { is_expected.to be_success }
      it { expect(subject.value).to be socket }
    end

    context 'on error' do
      before do
        expect(socket).to receive(:write).with("AMQP\x0\x0\x9\x1").and_raise(IOError)
      end

      it { is_expected.to be_failure }
      it { expect(subject.value).to be_kind_of(IOError) }
    end
  end
end
