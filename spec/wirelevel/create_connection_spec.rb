# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::CreateConnection do
  let(:socket) { double }
  let!(:create_socket) { ->(_) { Right(socket) } }
  let(:write_protocol) { ->(s) { Right(s) } }
  let!(:read_socket) { ->(s) { Right(s) } }
  let(:validate_protocol) { ->(s) { Right(s) } }
  let(:transaction) { described_class.new }

  before do
    Container.stub(:create_socket, create_socket)
    Container.stub(:write_protocol, write_protocol)
    Container.stub(:read_socket, read_socket)
    Container.stub(:validate_protocol, validate_protocol)
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
