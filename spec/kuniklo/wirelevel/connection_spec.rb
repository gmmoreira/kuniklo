# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Connection do
    let(:socket) { instance_double(Wirelevel::Socket) }

    subject { described_class.new(socket) }

    describe 'attributes' do
      its(:socket) { is_expected.to be socket }
    end

    describe '#start' do
      let(:connection_start) { double }

      before do
        expect(connection_start).to receive(:call).with(socket).and_return(Right(''))
        Container.stub('kuniklo.wirelevel.connection.methods.start', connection_start)
      end

      its(:start) { is_expected.to be_success }
    end
  end
end
