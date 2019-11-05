# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improvements::RatingBoost, type: :model do
  let(:rating_boost) { create :rating_boost }

  describe '#apply' do
    subject { rating_boost.apply(hunter) }

    context 'valid hunter' do
      let(:hunter) { create :hunter, charm: 2 }

      it { expect { subject }.to change(hunter, :charm).by(1) }
    end
  end

  describe '#valid_hunter?' do
    subject { rating_boost.valid_hunter?(hunter) }

    context 'hunter with valid rating' do
      let(:hunter) { create :hunter, charm: 2 }

      it {
        is_expected.to be_truthy
      }
    end

    context 'hunter with max rating' do
      let(:hunter) { create :hunter, charm: 3 }

      it { is_expected.to be_falsey }
    end
  end

  describe 'Adding an improvement to a hunter' do
    subject do
      hunter.improvements << rating_boost
      hunter.save
    end

    let(:hunter) { create(:hunter, charm: 2) }

    it { expect { subject }.to change(hunter.reload, :charm).by(1) }
  end
end
