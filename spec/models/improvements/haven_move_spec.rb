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

  describe '#improvable_options' do
    subject { improvement.improvable_option }

  end

  describe '#configured_move' do
    subject { improvement.configured_move(hunters_improvement) }
    let(:hunters_improvement) do
      build :hunters_improvement, improvement: improvement, 
        improvable: { move: { id: move.id }} 
    end
    let(:move) { create :moves_basic }

    it 'finds a move' do
      is_expected.to eq move
    end
  end

  describe '#configured_haven' do
    subject { improvement.configured_haven(hunters_improvement) }
    let(:hunters_improvement) do
      build :hunters_improvement, improvement: improvement, 
        improvable: { haven: { id: haven.id }} 
    end
    let(:haven) { create :haven }

    it 'finds a haven' do
      is_expected.to eq haven
    end
  end
end
