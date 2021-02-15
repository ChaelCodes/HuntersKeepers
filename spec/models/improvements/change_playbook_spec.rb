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

RSpec.describe Improvements::ChangePlaybook, type: :model do
  let(:change_playbook) { create(:change_playbook) }

  describe '#improvable_options' do
    subject { change_playbook.improvable_options(nil).dig(:playbook, :data) }

    let!(:playbook) { create :playbook }

    it { is_expected.not_to include change_playbook.playbook }

    it { is_expected.to include playbook }
  end
end
