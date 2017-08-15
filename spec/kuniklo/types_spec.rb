# frozen_string_literal: true

# require 'spec_helper'

RSpec.describe Types do
  describe Types::MethodFrameType do
    context 'valid value' do
      it { expect(subject[1]).to eq 1 }
    end

    context 'invalid value' do
      it { expect { subject[2] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe Types::HeaderFrameType do
    context 'valid value' do
      it { expect(subject[2]).to eq 2 }
    end

    context 'invalid value' do
      it { expect { subject[3] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe Types::BodyFrameType do
    context 'valid value' do
      it { expect(subject[3]).to eq 3 }
    end

    context 'invalid value' do
      it { expect { subject[4] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe Types::HeartbeatFrameType do
    context 'valid value' do
      it { expect(subject[8]).to eq 8 }
    end

    context 'invalid value' do
      it { expect { subject[5] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe Types::FrameType do
    context 'valid values' do
      [1, 2, 3, 8].each do |value|
        it { expect(subject[value]).to eq value }
      end
    end

    context 'invalid values' do
      [0, 5, 10, 1000].each do |value|
        it { expect { subject[value] }.to raise_error(Dry::Types::ConstraintError) }
      end
    end
  end

  describe Types::FrameEnd do
    context 'valid value' do
      it { expect(subject["\xCE".b]).to eq "\xCE".b }
    end

    context 'invalid value' do
      it { expect { subject["\xAA".b] }.to raise_error(Dry::Types::ConstraintError) }
    end
  end

  describe Types::FrameChannel do
    context 'valid value' do
      describe '0' do
        it { expect(subject[0]).to eq 0 }
      end

      describe '10' do
        it { expect(subject[10]).to eq 10 }
      end

      describe '65535' do
        it { expect(subject[65_535]).to eq 65_535 }
      end
    end

    context 'invalid value' do
      describe '-1' do
        it { expect { subject[-1] }.to raise_error(Dry::Types::ConstraintError) }
      end

      describe '65536' do
        it { expect { subject[65_536] }.to raise_error(Dry::Types::ConstraintError) }
      end
    end
  end
end
