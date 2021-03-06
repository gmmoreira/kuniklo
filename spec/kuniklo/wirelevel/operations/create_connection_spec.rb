# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::CreateConnection do
    let(:socket) { instance_double(Wirelevel::Socket) }
    subject { Container['kuniklo.wirelevel.operations.create_connection'] }

    it { expect(subject.call(socket)).to be_success }
    it { expect(subject.call(socket).value).to be_kind_of(Wirelevel::Connection) }
  end
end
