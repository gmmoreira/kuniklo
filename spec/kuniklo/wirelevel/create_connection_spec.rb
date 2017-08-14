# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::CreateConnection do
  let(:socket) { double }

  context 'when connection is valid' do
    let(:create_socket) { ->(_) { Right(socket) } }
    let(:data) { read_fixture('connection_start.bin') }

    subject { described_class.new }

    before do
      Container.stub('wirelevel.operations.create_socket', create_socket)
      allow(socket).to receive(:read).and_return(data)
      allow(socket).to receive(:buffer).and_return(data)
      allow(socket).to receive(:write)
    end

    it { expect(subject.call(Settings)).to be_success }
    it { expect(subject.call(Settings).value).to be_kind_of(Wirelevel::Connection) }
    it { expect(subject.call(Settings).value.socket).to be socket }
  end

  context 'when errors happen' do
    let(:create_socket) { ->(_) { Right(socket) } }
    let(:write_protocol) { ->(s) { Right(s) } }
    let(:read_socket) { ->(s) { Right(s) } }
    let(:validate_protocol) { ->(s) { Right(s) } }
    let(:transaction) { described_class.new }

    before do
      Container.stub('wirelevel.operations.create_socket', create_socket)
      Container.stub('wirelevel.operations.write_protocol', write_protocol)
      Container.stub('wirelevel.operations.read_socket', read_socket)
      Container.stub('wirelevel.operations.validate_protocol', validate_protocol)
    end

    subject { transaction.call nil }

    context 'when fail to connect' do
      let(:create_socket) { ->(_) { Left(IOError) } }

      it { is_expected.to be_failure }
    end

    context 'when fail to write protocol' do
      let(:write_protocol) { ->(_) { Left(IOError) } }

      it { is_expected.to be_failure }
    end

    context 'when fail to read socket' do
      let(:read_socket) { ->(_s) { Left(IOError) } }

      it { is_expected.to be_failure }
    end

    context 'when protocol is not validated' do
      let(:validate_protocol) { ->(_s) { Left(IOError) } }

      it { is_expected.to be_failure }
    end
  end
end
