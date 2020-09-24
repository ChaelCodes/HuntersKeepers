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

RSpec.describe Improvements::Retire, type: :model do
  let(:retire) { create :retire }

  describe 'valid factory' do
    it { expect(retire).to be_valid }
  end

  describe '#improvable_options' do
    subject { retire.improvable_options(nil) }

    it { is_expected.to be_empty }
  end
end
