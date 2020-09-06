# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improves::HavenMove do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build(:hunters_improvement,
          improvement: improvement,
          hunter: hunter,
          improvable: improvable)
  end
  let(:improvement) { create :haven_move }
  let(:hunter) { create :hunter, playbook: improvement.playbook }
  let(:improvable) do
    { move: { id: move.id },
      haven: { id: haven.id } }
  end
  let(:move) { create :move, :haven }
  let(:haven) { create :haven }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    it 'adds the move to the hunter' do
      improve
      hunters_move = hunter.hunters_move_for(move_id: move.id)
      expect(hunters_move.haven).to eq haven
    end

    context 'when hunter already has the move' do
      before { hunter.moves << move }

      it { is_expected.to be_falsey }

      it 'add error to hunters improvement' do
        improve
        hunters_improvement.errors.full_messages.include?(/already has move/)
      end
    end

    context 'when the move is not a haven move' do
      let(:move) { create :move }

      it { is_expected.to be_falsey }

      it 'add error to hunters improvement' do
        improve
        hunters_improvement.errors.full_messages.include?(/Move is not a haven option/)
      end
    end

    context 'when the move is not a move' do
      let(:move) { create :playbook }

      it { is_expected.to be_falsey }

      it 'add error to hunters improvement' do
        improve
        hunters_improvement.errors.full_messages.include?(/Move not found/)
      end
    end

    context 'when hunter and improvement playbooks do not match' do
      let(:hunter) { create :hunter }

      it { is_expected.to be_falsey }
    end
  end
end
