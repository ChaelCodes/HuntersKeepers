# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  advanced    :boolean
#  description :string
#  rating      :integer
#  stat_limit  :integer
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
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

RSpec.describe Improvement, type: :model do
  describe '.not_advanced' do
    subject { described_class.not_advanced }

    let!(:advanced_improvement) { create(:improvement, advanced: true) }
    let!(:improvement) { create(:improvement) }

    it { include(improvement) }
    it { is_expected.not_to include(advanced_improvement) }
  end

  describe '.advanced_eligible?' do
    subject { described_class.advanced_eligible?(hunter) }

    let(:hunter) { create :hunter }

    it { is_expected.to be_falsey }

    context 'with 5 improvements already' do
      let!(:improvements) do
        create_list :improvement, 5, playbook: hunter.playbook
      end

      before do
        hunter.improvements << improvements
        hunter.save
      end

      it { is_expected.to be_truthy }
    end
  end
end
