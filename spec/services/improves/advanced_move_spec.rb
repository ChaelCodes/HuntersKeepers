# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improves::AdvancedMove do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build :hunters_improvement,
          hunter: hunter,
          improvement: improvement,
          improvable: improvable
  end
  let(:improvement) { create :advanced_move }
  let(:improvable) do
    {
      moves: [
        { 'id': move.id, 'name': move.name, 'description': move.description },
        { 'id': move2.id, 'name': move2.name, 'description': move2.description }
      ]
    }
  end
  let(:hunter) { create :hunter, playbook: improvement.playbook }
  let(:move) { create :moves_basic }
  let(:move2) { create :moves_basic }

  before { hunter.moves << [move, move2] }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    it 'marks the move as advanced' do
      improve
      expect(hunter.hunters_move_for(move_id: move.id)).to be_advanced
    end

    context 'when move is not basic' do
      let(:move) { create :move }

      it { is_expected.to be_falsey }

      it 'adds error to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include match(/Moves are not all Basic/)
      end
    end

    context 'with only one move' do
      let(:improvable) do
        {
          moves:
          [{ 'id': move.id, 'name': move.name, 'description': move.description }]
        }
      end

      it { is_expected.to be_falsey }

      it 'appends errors to hunters_improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include('Improvable does not have 2 moves')
      end
    end

    context 'when hunter has already advanced move' do
      before { hunter.hunters_moves.find_by(move: move).update(advanced: true) }

      it { is_expected.to be_falsey }

      it 'appends errors to hunters_improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include('Moves already advanced')
      end
    end
  end
end
