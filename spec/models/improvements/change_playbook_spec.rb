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

RSpec.describe Improvements::ChangePlaybook, type: :model do
  let(:change_playbook) { create(:change_playbook) }

  describe '#improvable_options' do
    subject { change_playbook.improvable_options(nil).dig(:playbook, :data) }

    let!(:playbook) { create :playbook }

    it { is_expected.not_to include change_playbook.playbook }

    it { is_expected.to include playbook }
  end
end
