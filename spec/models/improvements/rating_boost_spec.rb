# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improvements::RatingBoost, type: :model do
  let(:rating_boost) { create :rating_boost }
  let(:hunters_improvement) { create(:hunters_improvement, hunter: hunter, improvement: rating_boost) }

  describe '#apply' do
    subject { rating_boost.apply(hunters_improvement) }

    context 'valid hunter' do
      let(:hunter) { create :hunter, playbook: rating_boost.playbook, charm: 2 }

      it { expect { subject }.to change(hunter, :charm).by(1) }
    end
  end

  describe '#under_max_limit?' do
    subject { rating_boost.under_max_limit?(hunter) }

    context 'hunter with valid rating' do
      let(:hunter) { create :hunter,  playbook: rating_boost.playbook, charm: 2 }

      it {
        is_expected.to be_truthy
      }
    end

    context 'hunter with max rating' do
      let(:hunter) { create :hunter,  playbook: rating_boost.playbook, charm: 3 }

      it { is_expected.to be_falsey }
    end
  end

  describe 'Adding an improvement to a hunter' do
    subject do
      hunter.improvements << rating_boost
      hunter.save
    end

    let(:hunter) { create(:hunter,  playbook: rating_boost.playbook, charm: 2) }

    it { expect { subject }.to change(hunter.reload, :charm).by(1) }
  end

  describe '#add_errors' do
    subject { rating_boost.add_errors(hunters_improvement) }
    let(:hunters_improvement) { build(:hunters_improvement, hunter: hunter, improvement: rating_boost) }

    context 'invalid hunter' do
      let(:hunter) { create :hunter, charm: 3 }

      it 'applies errors to hunters improvement' do
        subject
        expect(hunters_improvement.errors.full_messages).to include "Hunter charm rating would exceed max for improvement."
      end
    end

    context 'valid hunter' do
      let(:hunter) { create :hunter,  playbook: rating_boost.playbook, charm: 2 }

      it 'leaves the hunter improvement error free' do
        subject
        expect(hunters_improvement.errors).to be_empty
      end
    end
  end
end
