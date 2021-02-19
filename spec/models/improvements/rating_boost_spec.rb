# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
# @!attribute id
#   @return []
# @!attribute advanced
#   @return [Boolean]
# @!attribute description
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute stat_limit
#   @return [Integer]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_improvements_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
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
