# frozen_string_literal: true

require 'spec_helper'

module Kuniklo
  RSpec.describe Wirelevel::Connection::Start do
    let(:version_major) { 0 }
    let(:version_minor) { 9 }

    subject do
      described_class.new(version_major: version_major,
                          version_minor: version_minor,
                          server_properties: {},
                          mechanisms: 'AMQP_PLAIN',
                          locales: 'en_US')
    end

    its(:version_major) { is_expected.to eq 0 }
    its(:version_minor) { is_expected.to eq 9 }
    its(:server_properties) { is_expected.to eq({}) }
    its(:mechanisms) { is_expected.to eq 'AMQP_PLAIN' }
    its(:locales) { is_expected.to eq 'en_US' }
  end
end
