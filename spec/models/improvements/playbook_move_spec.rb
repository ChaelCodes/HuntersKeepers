# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
# @!attribute id
#   @return []
# @!attribute advanced
#   @return [Boolean]
# @!attribute description
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute stat_limit
#   @return [Integer]
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
#  index_improvements_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
require 'rails_helper'

RSpec.describe Improvements::PlaybookMove, type: :model do
  let(:playbook_move) { create(:playbook_move) }

  describe '#improvable_options' do
    subject { playbook_move.improvable_options(hunter) }

    let(:hunter) { create :hunter }
    let!(:move) { create :move, playbook: playbook_move.playbook }

    it { expect(subject.dig(:move, :data)).to include(move) }

    context 'when move not in playbook' do
      let!(:move) { create :move }

      it { expect(subject.dig(:move, :data)).not_to include(move) }
    end

    context 'when hunter has move' do
      before { hunter.moves << move }

      it { expect(subject.dig(:move, :data)).not_to include(move) }
    end
  end
end
