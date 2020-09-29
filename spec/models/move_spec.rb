# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  name          :string
#  rating        :integer
#  six_and_under :string
#  seven_to_nine :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#  description   :string
#
require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:move) { build :move }

  describe '::with_hunter_moves' do
    subject { described_class.with_hunter_moves(hunter.id) }

    let!(:move) { create :move }
    let(:hunter) { create :hunter }
    let(:hunters_move) { HuntersMove.first }

    context 'when target hunter has move' do
      before { hunter.moves << move }

      it 'includes the hunter move associated with target hunter' do
        expect(subject.pluck(:'hunters_moves.id', :'moves.id'))
          .to include [hunters_move.id, move.id]
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
