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

RSpec.describe Improvement, type: :model do
  describe '.not_advanced' do
    subject { Improvement.not_advanced }

    let!(:advanced_improvement) { create(:improvement, advanced: true) }
    let!(:improvement) { create(:improvement) }

    it { include(improvement) }
    it { is_expected.not_to include(advanced_improvement) }
  end
end
