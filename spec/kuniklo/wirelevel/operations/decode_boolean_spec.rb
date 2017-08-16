# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::DecodeBoolean do
    let(:data) { "\x01\x1Aexchange_exchange_bindings".b }

    subject { Container['kuniklo.wirelevel.operations.decode_boolean'].call(data) }

    it { is_expected.to be_success }
    its('value.first') { is_expected.to eq true }
    its('value.last') { is_expected.to eq "\x1Aexchange_exchange_bindings".b }
  end
end
