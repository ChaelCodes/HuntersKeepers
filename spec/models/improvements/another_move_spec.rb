# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improvements::AnotherMove, type: :model do
  let(:another_move) { create(:another_move) }
  let(:hunters_improvement) {
    build :hunters_improvement,
          hunter: hunter,
          improvement: another_move,
          improveable: {'id': move.id, 'name': move.name, 'description': move.description }
  }
  let(:hunter) { create :hunter, playbook: another_move.playbook  }
  let(:move) { create :moves_rollable, playbook: create(:playbook) }

  describe '#apply' do
    subject { another_move.apply(hunters_improvement) }

    let(:hunter) { create(:hunter, playbook: another_move.playbook) }

    context 'move is from a different playbook as hunter' do
      let(:move) { create(:moves_descriptive, playbook: create(:playbook)) }

      it 'gives the move to the hunter' do
        subject
        expect(hunter.reload.moves).to include move
      end

      context 'hunter already has move' do
        before { hunter.moves << move }

        it { is_expected.to be_falsey }

        it 'does not duplicate move' do
          subject
          move_ids = hunter.reload.moves.pluck(:id)
          expect(move_ids.count(move.id)).to eq 1
        end

        it 'does not create improvement' do
          hi = HuntersImprovement.find_by(hunter: hunter, improvable: move)
          expect(hi).to be_nil
        end
      end
    end

    context 'move is from the same playbook' do
      let(:move) { create(:moves_descriptive, playbook: hunter.playbook) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#move_matches_playbook?' do
    subject { another_move.move_matches_playbook?(move) }

    context 'move is from improvement playbook' do
      let(:move) { create(:moves_descriptive, playbook: another_move.playbook) }

      it { is_expected.to be_truthy }
    end

    context 'move is not from improvement playbook' do
      let(:move) { create(:moves_descriptive) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#hunter_has_move?' do
    subject { another_move.hunter_has_move?(hunter, move) }

    context 'hunter already has move' do
      before { hunter.moves << move }

      it { is_expected.to be_truthy }
    end

    context 'hunter does not have move' do
      it { is_expected.to be_falsey }
    end
  end

  describe '#move' do
    subject { another_move.move(hunters_improvement) }

    let(:move) { create :move }
    let(:hunters_improvement) { build :hunters_improvement, improvement: another_move, hunter: hunter, improveable: { "id": move.id, "name": move.name, "description": move.description } }

    it { is_expected.to eq Move.find move.id }
  end

  describe '#add_errors' do
    subject { another_move.add_errors(hunters_improvement) }

    context 'valid hunter and move' do
      it 'does not add errors to hunters improvement' do
        subject
        expect(hunters_improvement.errors).to be_empty
      end
    end

    context 'improvable is not a move' do
      let(:move) { create(:playbook) }
      it 'adds errors to the hunters improvement' do
        subject
        expect(hunters_improvement.errors.full_messages).to include 'Improvable is not a subclass of Move.'
      end
    end
  end
end
