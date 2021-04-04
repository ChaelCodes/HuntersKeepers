# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute haven
#   @return [Boolean]
# @!attribute name
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute seven_to_nine
#   @return [String]
# @!attribute six_and_under
#   @return [String]
# @!attribute ten_plus
#   @return [String]
# @!attribute twelve_plus
#   @return [String]
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
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:move) { build :move }

  describe '::include_hunter_moves' do
    subject { described_class.include_hunter_moves(hunter.id) }

    let!(:move) { create :move }
    let!(:move1) { create :move }
    let(:hunter) { create :hunter }
    let(:hunters_move) { HuntersMove.first }

    context 'when target hunter has move' do
      before { hunter.moves << [move, move1] }

      it 'includes the hunter move associated with target hunter' do
        expect(subject.pluck(:'hunters_moves.id', :'moves.id'))
          .to include [hunters_move.id, move.id]
      end

      it 'does not duplicate moves' do
        expect(subject.where('moves.id': move.id).count)
          .to eq 1
      end
    end

    context 'without hunter move' do
      it 'includes basic moves' do
        expect(subject.pluck(:'hunters_moves.id', :'moves.id'))
          .to include [nil, move.id]
      end
    end

    context 'unrelated hunter move' do
      let(:unrelated_hunter) { create :hunter }

      before { unrelated_hunter.moves << move }

      it 'does not include other hunters hunters_moves' do
        expect(subject.pluck(:'hunters_moves.id', :'moves.id'))
          .not_to include [hunters_move.id, move.id]
        expect(subject.pluck(:'hunters_moves.id', :'moves.id'))
          .to include [nil, move.id]
      end
    end
  end

  describe '#rollable?' do
    subject { move.rollable? }

    it { is_expected.to be_falsey }
  end

  describe  "#validations" do
    context "when name is nil" do
      let(:move) { build :move, name: nil }

      it "should not be valid" do
        expect(move).not_to be_valid
      end
    end

    context "when description is nil" do
      let(:move) { build :move, description: nil }

      it "should not be valid" do
        expect(move).not_to be_valid
      end
    end
  end
end
