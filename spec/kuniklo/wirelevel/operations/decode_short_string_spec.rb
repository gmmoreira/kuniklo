# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::DecodeShortString do
    let(:data) { "\fcapabilitiesF\x00\x00\x00\xC7\x12".b }

    subject { Container['kuniklo.wirelevel.operations.decode_short_string'].call(data) }

    it { is_expected.to be_success }
    its('value.first') { is_expected.to eq 'capabilities' }
  end
end
