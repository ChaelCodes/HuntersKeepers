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
  let(:retire) { create :retire, playbook: hunter.playbook }
  let(:hunter) { create :hunter }
  let(:hunters_improvement) do
    build :hunters_improvement,
          improvement: retire,
          hunter: hunter,
          improvable: ''
  end

  describe 'valid factory' do
    it { expect(retire).to be_valid }
  end

  describe '#apply' do
    subject(:apply) { retire.apply(hunters_improvement) }

    it 'retired the hunter' do
      expect { apply }.to change(hunter.reload, :retired).from(nil).to(true)
    end

    it 'does not invalidate the hunter' do
      apply
      expect(hunter).to be_valid
    end
  end

  describe '#add_errors' do
    subject(:add_errors) { retire.add_errors(hunters_improvement) }

    it { is_expected.to be_falsey }

    context 'when hunter has already retired' do
      let(:hunter) { create :hunter, retired: true }

      it 'adds errors to improvable' do
        add_errors
        error = 'Hunter has already retired.'
        expect(hunters_improvement.errors.full_messages).to include error
      end
    end
  end

  describe '#improvable_options' do
    subject { retire.improvable_options(hunter) }

    it { is_expected.to eq [] }
  end
end
