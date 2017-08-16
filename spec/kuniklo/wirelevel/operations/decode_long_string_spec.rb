# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::DecodeLongString do
    let(:data) { "\x00\x00\x00\x13rabbit@2113ce8fab2b\tcopyright".b }

    subject { Container['kuniklo.wirelevel.operations.decode_long_string'].call(data) }

    it { is_expected.to be_success }
    its('value.first') { is_expected.to eq 'rabbit@2113ce8fab2b'.b }
    its('value.last') { is_expected.to eq "\tcopyright".b }
  end
end
