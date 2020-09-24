# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improves::GainLuck do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build(:hunters_improvement,
          improvement: improvement,
          hunter: hunter,
          improvable: nil)
  end
  let(:improvement) { create :gain_luck }
  let(:hunter) { create :hunter, playbook: improvement.playbook, luck: luck }
  let(:luck) { 6 }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    it 'increments luck' do
      expect { improve }.to change(hunter, :luck)
        .from(6).to(7)
    end

    context 'when hunter has a luck of 5' do
      let(:luck) { 5 }

      it 'increments luck by 1' do
        expect { improve }.to change(hunter, :luck)
          .from(5).to(6)
      end
    end

    context 'when hunter has a luck of 0' do
      let(:luck) { 0 }

      it 'increments luck by 1' do
        expect { improve }.to change(hunter, :luck)
          .from(0).to(1)
      end
    end

    it 'does not invalidate the hunter' do
      improve
      expect(hunter).to be_valid
    end

    context 'with hunter at max luck' do
      let(:luck) { 7 }

      it { is_expected.to be_falsey }

      it 'applies errors to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include 'Hunter already has maximum luck'
      end

      it { expect { improve }.not_to change(hunter, :luck) }
    end
  end

  describe '#valid?' do
    subject { improve_hunter.valid? }

    it { is_expected.to be_truthy }

    context 'when hunter has max luck' do
      let(:luck) { 7 }

      it { is_expected.to be_falsey }
    end
  end

  describe '#max_luck?' do
    subject { improve_hunter.max_luck? }

    it { is_expected.to be_falsey }

    context 'when hunter has max luck' do
      let(:luck) { 7 }

      it { is_expected.to be_truthy }
    end
  end
end
