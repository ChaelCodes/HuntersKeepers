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

RSpec.describe Improvements::HavenMove, type: :model do
  let(:improvement) { create(:haven_move) }
  let(:hunters_improvement) do
    build :hunters_improvement,
          hunter: hunter,
          improvement: improvement,
          improvable: {
            'move': move.as_json(only: %i[id name description]),
            'haven': haven.as_json(only: %i[id name description])
          }
  end
  let(:hunter) { create :hunter, playbook: improvement.playbook }
  let(:move) { create :move, :haven }
  let(:haven) { create :haven }

  describe '#apply' do
    subject(:apply) { improvement.apply(hunters_improvement) }

    it 'creates a hunters move with a haven' do
      apply
      hunters_move = hunter.hunters_move_for(move_id: move.id)
      expect(hunters_move).to have_attributes(
        haven_id: haven.id,
        hunter_id: hunter.id,
        move_id: move.id
      )
    end
  end

  describe '#improvable_options' do
  end
end
