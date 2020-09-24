# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  description :string
#  type        :string
#  rating      :integer
#  stat_limit  :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  advanced    :boolean
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
