# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Socket do
    let(:socket) { double }

    subject { described_class.new(socket) }

    describe '#read' do
      let(:data) { "AMQP\x0\x0\x9\x1".b }

      before do
        expect(socket).to receive(:recv).with(2**16).and_return(data)
        subject.read(2**16)
      end

      it { expect(subject.buffer).to eq data }
    end

    describe '#write' do
    end
  end
end
