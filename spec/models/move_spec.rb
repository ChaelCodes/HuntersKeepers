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
  let(:move) { create :move }

  describe '.with_hunter_moves' do
    subject { described_class.with_hunter_moves(hunter.id) }

    let(:hunter) { create :hunter }
    let(:hunters_move) { HuntersMove.first }

    before { move }

    context 'with hunter move' do
      before { hunter.moves << move }

      it 'includes hunter moves' do
        expect(subject.pluck(:'hunters_moves.id', :'moves.id'))
          .to include [hunters_move.id, move.id]
      end
    end

    context 'without hunter move' do
      it 'includes unclaimed moves' do
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

  describe '#roll' do
    subject { move.roll(hunter) }

    let(:move) { create :moves_basic, rating: :cool }
    let(:hunter) { create :hunter }

    before { allow_any_instance_of(Random).to receive(:rand).and_return(1) }

    it { is_expected.to eq hunter.cool + 1 }
  end

  describe '#roll_results' do
    subject { move.roll_results(hunter) }

    let(:move) { create :move, rating: :cool }
    let(:hunter) { create :hunter, cool: 1 }

    before { allow_any_instance_of(Random).to receive(:rand).and_return(roll_result) }

    context 'roll is 5' do
      let(:roll_result) { 5 }

      it 'catches the top boundary of failure' do
        expect(subject).to be_kind_of(Move::RollResult)
        expect(subject.roll).to eq 6
        expect(subject.result).to eq "Your total 6 resulted in #{move.six_and_under}"
      end
    end

    context 'roll is 7' do
      let(:roll_result) { 7 }

      it 'returns 7-9 if value is in the middle' do
        expect(subject.roll).to eq 8
        expect(subject.result).to eq "Your total 8 resulted in #{move.seven_to_nine}"
      end
    end

    context 'roll is 9' do
      let(:roll_result) { 9 }

      it 'return 10+ on the bottom boundary' do
        expect(subject.roll).to eq 10
        expect(subject.result).to eq "Your total 10 resulted in #{move.ten_plus}"
      end
    end

    context 'roll is 12' do
      let(:roll_result) { 12 }

      it { expect(subject.result).to eq "Your total 13 resulted in #{move.ten_plus}" }

      context 'move is not basic' do
        let(:move) { create :moves_rollable, rating: :cool }

        it { eq "Your total 13 resulted in #{move.ten_plus}" }
      end
    end
  end

  describe '#rollable?' do
    subject { move.rollable? }

    it { is_expected.to be_truthy }
  end
end
