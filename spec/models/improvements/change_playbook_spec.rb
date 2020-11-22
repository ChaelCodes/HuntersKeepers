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

RSpec.describe Improvements::ChangePlaybook, type: :model do
  let(:change_playbook) { create(:change_playbook) }

  describe '#improvable_options' do
    subject { change_playbook.improvable_options(nil).dig(:playbook, :data) }

    let!(:playbook) { create :playbook }

    it { is_expected.not_to include change_playbook.playbook }

    it { is_expected.to include playbook }
  end
end
