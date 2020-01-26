# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improvements::PlaybookMove, type: :model do
  let(:playbook_move) { create(:playbook_move) }
  let(:hunters_improvement) { build :hunters_improvement, improvement: playbook_move, hunter: hunter, improveable: { "id": move.id } }
  let(:hunter) { create :hunter, playbook: playbook_move.playbook  }
  let(:move) { create :moves_rollable, playbook: playbook_move.playbook }

  describe '#apply' do
    subject { playbook_move.apply(hunters_improvement) }

    let(:hunter) { create(:hunter, playbook: playbook_move.playbook) }

    context 'move is from the same playbook as hunter' do
      let(:move) { create(:moves_descriptive, playbook: playbook_move.playbook) }

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

    context 'move is from another playbook' do
      let(:move) { create(:moves_descriptive, playbook: create(:playbook)) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#move_matches_playbook?' do
    subject { playbook_move.move_matches_playbook?(move) }

    context 'move is from improvement playbook' do
      let(:move) { create(:moves_descriptive, playbook: playbook_move.playbook) }

      it { is_expected.to be_truthy }
    end

    context 'move is not from improvement playbook' do
      let(:move) { create(:moves_descriptive) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#not_a_move?' do
    subject { playbook_move.not_a_move?(move) }

    context 'Moves::Base' do
      let(:move) { create(:move) }

      it { is_expected.to be_falsey }
    end

    context 'Moves::Descriptive' do
      let(:move) { create :moves_descriptive }

      it { is_expected.to be_falsey }
    end

    context 'Playbook' do
      let(:move) { create :playbook }

      it { is_expected.to be_truthy }
    end
  end

  describe '#hunter_has_move?' do
    subject { playbook_move.hunter_has_move?(hunter, move) }

    context 'hunter already has move' do
      before { hunter.moves << move }

      it { is_expected.to be_truthy }
    end

    context 'hunter does not have move' do
      it { is_expected.to be_falsey }
    end
  end

  describe '#add_errors' do
    subject { playbook_move.add_errors(hunters_improvement) }

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
