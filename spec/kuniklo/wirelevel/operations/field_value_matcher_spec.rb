# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::FieldValueMatcher do
    subject { Container['kuniklo.wirelevel.operations.field_value_matcher'].call(data) }

    describe 'F' do
      let(:data) { "F\x0\x0\x0\x0".b }

      it { is_expected.to be_success }
      its('value.first') { is_expected.to be_kind_of(Wirelevel::Operations::DecodeFieldTable) }
      its('value.last') { is_expected.to eq "\x0\x0\x0\x0".b }
    end

    describe 't' do
      let(:data) { "t\x01\x1Aexchange_exchange_bindings".b }

      it { is_expected.to be_success }
      its('value.first') { is_expected.to be_kind_of(Wirelevel::Operations::DecodeBoolean) }
      its('value.last') { is_expected.to eq "\x01\x1Aexchange_exchange_bindings".b }
    end

    describe 'S' do
      let(:data) { "S\x00\x00\x00\x13rabbit@2113ce8fab2b\tcopyright" }

      it { is_expected.to be_success }
      its('value.first') { is_expected.to be_kind_of(Wirelevel::Operations::DecodeLongString) }
      its('value.last') { is_expected.to eq "\x00\x00\x00\x13rabbit@2113ce8fab2b\tcopyright".b }
    end

    describe 'unkown' do
      let(:data) { "A\x00\x00\x00\x13rabbit@2113ce8fab2b\tcopyright" }

      it { is_expected.to be_failure }
    end
  end
end
