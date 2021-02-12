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

RSpec.describe Improvements::HavenMove, type: :model do
  let(:improvement) { create(:haven_move) }

  describe '#improvable_options' do
    subject { improvement.improvable_option }

  end

  describe '#configured_move' do
    subject { improvement.configured_move(hunters_improvement) }
    let(:hunters_improvement) do
      build :hunters_improvement, improvement: improvement, 
        improvable: { move: { id: move.id }} 
    end
    let(:move) { create :moves_basic }

    it 'finds a move' do
      is_expected.to eq move
    end
  end

  describe '#configured_haven' do
    subject { improvement.configured_haven(hunters_improvement) }
    let(:hunters_improvement) do
      build :hunters_improvement, improvement: improvement, 
        improvable: { haven: { id: haven.id }} 
    end
    let(:haven) { create :haven }

    it 'finds a haven' do
      is_expected.to eq haven
    end
  end
end
