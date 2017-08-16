# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Operations::CreateSocket do
    context 'when TCP socket is open successfully' do
      let(:socket) { double }

      before do
        expect(::Socket).to receive(:tcp).and_return(socket)
      end

      it { expect(subject.call).to be_success }
      it { expect(subject.call.value).to be_kind_of(Wirelevel::Socket) }
    end

    context 'when connection is refused' do
      before do
        expect(::Socket).to receive(:tcp).and_raise(Errno::ECONNREFUSED)
      end

      it { expect(subject.call).to be_failure }
      it { expect(subject.call.value).to be_kind_of Errno::ECONNREFUSED }
    end
  end
end
