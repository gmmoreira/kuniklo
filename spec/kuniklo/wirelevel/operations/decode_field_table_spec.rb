# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::DecodeFieldTable do
    let(:data) { read_fixture('field_table.bin').b }

    subject { Container['kuniklo.wirelevel.operations.decode_field_table'].call(data) }

    it { is_expected.to be_success }
  end
end
