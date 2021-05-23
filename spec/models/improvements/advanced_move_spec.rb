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

RSpec.describe Improvements::AdvancedMove, type: :model do
  let(:advanced_move) { create(:advanced_move) }

  describe '#improvable_options' do
    subject { advanced_move.improvable_options(hunter).dig(:moves, :data) }

    let(:hunter) { create :hunter, playbook: advanced_move.playbook }
    let!(:move) { create :moves_basic }
    let!(:move2) { create :moves_basic }

    it { is_expected.to include(move) }
    it { is_expected.to include(move2) }

    context 'move is advanced' do
      before { hunter.hunters_move_for(move_id: move.id).update(advanced: true) }

      it { is_expected.not_to include(move) }
    end

    context 'hunter does not have move yet' do
      before { hunter.moves = [] }

      let!(:basic_move) { create :moves_basic }

      it { is_expected.to include(move) }

      it 'includes all basic moves' do
        expect(hunter.moves.count).to eq 0
        expect(hunter.hunters_moves.count).to eq 0
        expect(subject.count(1)).to eq Moves::Basic.count
      end
    end
  end
end
