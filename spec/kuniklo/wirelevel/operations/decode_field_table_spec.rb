require 'spec_helper'

RSpec.describe Wirelevel::Operations::DecodeFieldTable do
  let(:data) { read_fixture('field_table.bin').b }

  subject { Container['wirelevel.operations.decode_field_table'].call(data) }

  it { is_expected.to be_success }
end
