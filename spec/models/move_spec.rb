# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:move) { create :moves_basic, rating: :cool }

  describe '.with_hunter_moves' do
    subject { Move.with_hunter_moves(hunter.id) }
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
    let(:hunter) { create :hunter }
    before { allow_any_instance_of(Random).to receive(:rand).and_return(1) }

    it { is_expected.to eq hunter.cool + 1 }
  end

  describe '#roll_results' do
    subject { move.roll_results(hunter) }
    let(:hunter) { create :hunter, cool: 1 }
    before { allow_any_instance_of(Random).to receive(:rand).and_return(roll_result) }

    context 'roll is 5' do
      let(:roll_result) { 5 }

      it {
        is_expected.to eq "Your total 6 resulted in #{move.six_and_under}"
      }
    end

    context 'roll is 7' do
      let(:roll_result) { 7 }

      it { is_expected.to eq "Your total 8 resulted in #{move.seven_to_nine}" }
    end

    context 'roll is 9' do
      let(:roll_result) { 9 }

      it { is_expected.to eq "Your total 10 resulted in #{move.ten_plus}" }
    end

    context 'roll is 11' do
      let(:roll_result) { 10 }

      it { is_expected.to eq "Your total 11 resulted in #{move.ten_plus}" }
    end

    context 'roll is 12' do
      let(:roll_result) { 12 }

      it { eq "Your total 13 resulted in #{move.ten_plus}" }

      context 'hunter has advanced move' do
        it 'returns advanced result' do
          expect(hunter).to receive(:advanced?).and_return(true)
          is_expected.to eq "Your total 13 resulted in #{move.twelve_plus}"
        end
      end

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
