# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  description :string
#  type        :string
#  rating      :integer
#  stat_limit  :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  advanced    :boolean
#
require 'rails_helper'

RSpec.describe Improvements::RatingBoost, type: :model do
  let(:rating_boost) { create :rating_boost }
  let(:hunters_improvement) { build(:hunters_improvement, hunter: hunter, improvement: rating_boost) }

  describe 'Adding an improvement to a hunter' do
    subject do
      hunter.improvements << rating_boost
      hunter.save
    end

    let(:hunter) { create(:hunter, playbook: rating_boost.playbook, charm: 2) }

    it { expect { subject }.to change(hunter.reload, :charm).by(1) }
  end

  describe '#configured_rating' do
    subject { rating_boost.configured_rating(hunters_improvement) }

    let(:hunter) { create :hunter, playbook: rating_boost.playbook }
    let(:hunters_improvement) { build(:hunters_improvement, hunter: hunter, improvement: rating_boost) }

    context 'rating configured on improvement' do
      it { is_expected.to eq 'charm' }
    end

    context 'rating configured on hunters improvement' do
      let(:rating_boost) { create :rating_boost, rating: nil }
      let(:hunters_improvement) { create(:hunters_improvement, hunter: hunter, improvement: rating_boost, improvable: { rating: 'cool' }) }

      it { is_expected.to eq 'cool' }
    end
  end
end
