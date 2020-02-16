# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improvements::AnotherMove, type: :model do
  let(:advanced_move) { create(:advanced_move) }
  let(:hunters_improvement) do
    build :hunters_improvement,
          hunter: hunter,
          improvement: advanced_move,
          improvable: improvable
  end
  let(:improvable) { [{'id': move.id, 'name': move.name, 'description': move.description }, {'id': move2.id, 'name': move2.name, 'description': move2.description }] }
  let(:hunter) { create :hunter, playbook: advanced_move.playbook  }
  let(:move) { create :moves_basic }
  let(:move2) { create :moves_basic }
  before { hunter.moves << [move, move2] }

  describe '#apply' do
    subject { advanced_move.apply(hunters_improvement) }

    it 'sets move to advanced' do
      expect { subject }.to change { hunter.advanced?(move) }.from(false).to(true)
    end

    it { is_expected.to be_truthy }

    context 'one move' do
      let(:improvable) { [{'id': move.id, 'name': move.name, 'description': move.description }] }

      it { is_expected.to be_falsey }

      it 'appends errors to hunters_improvement' do
        subject
        expect(hunters_improvement.errors.full_messages).to include('Improvable does not have 2 moves')
      end
    end

    context 'hunter has already advanced move' do
      before { hunter.hunters_moves.find_by(move: move).update(advanced: true) }
      it { is_expected.to be_falsey }

      it 'appends errors to hunters_improvement' do
        subject
        expect(hunters_improvement.errors.full_messages).to include("Hunter already advanced move 'Act Under Pressure'")
      end
    end
  end

  describe '#hunters_moves' do
    subject { advanced_move.hunters_moves(hunters_improvement) }

    it 'should return moves from the hunter' do
      is_expected.to include(hunter.hunters_moves.find_by(move: move))
    end
  end

  describe '#improvable_options' do
    subject { advanced_move.improvable_options(hunter) }

    it { is_expected.to include(move) }
    it { is_expected.to include(move2) }

    context 'move is advanced' do
      before { hunter.hunters_moves.find_by(move: move).update(advanced: true) }

      it { is_expected.not_to include(move) }
    end
  end

  describe '#options_count' do
    subject { advanced_move.options_count }

    it { is_expected.to eq 2 }
  end
end
