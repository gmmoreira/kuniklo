# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Wirelevel::ConnectionStart do
  subject { Container['wirelevel.connection_start'] }

  context 'from fixture' do
    let(:data) { read_fixture('connection_start.bin') }
    let(:socket) { instance_double(Wirelevel::Socket) }

    before do
      allow(socket).to receive(:buffer).and_return(data)
    end
  end

  # before do
  #   Container.stub('wirelevel.operations.read_frame', read_frame)
  #   Container.stub('wirelevel.operations.connection.decode_start', decode_start)
  # end
end
