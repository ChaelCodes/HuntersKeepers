# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improves::PlaybookMove do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build(:hunters_improvement,
          improvement: improvement,
          hunter: hunter,
          improvable: improvable)
  end
  let(:improvement) { create :playbook_move }
  let(:hunter) { create :hunter, playbook: improvement.playbook }
  let(:improvable) { { move: { id: move.id } } }
  let(:move) { create :move, playbook: improvement.playbook }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    it 'adds the move to the hunter' do
      improve
      expect(hunter.hunters_move_for(move_id: move.id)).to be_present
    end

    context 'when move is from another playbook' do
      let(:move) { create :move }

      it 'adds error to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include match(/Move doesn't match improvement playbook/)
      end
    end
  end
end
