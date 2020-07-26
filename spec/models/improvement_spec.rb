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
      let!(:improvements) { create_list :improvement, 5, playbook: hunter.playbook }

      before do
        hunter.improvements << improvements
        hunter.save
      end

      it { is_expected.to be_truthy }
    end
  end

  describe '#add_errors' do
    subject(:add_errors) do
      improvement.add_errors(hunters_improvement)
      hunters_improvement.errors.full_messages
    end

    let(:hunters_improvement) do
      build :hunters_improvement,
            hunter: hunter,
            improvement: improvement
    end
    let(:hunter) { build :hunter }
    let(:improvement) { build :improvement, playbook: hunter.playbook }

    it { is_expected.to be_empty }

    context 'when hunter playbook does not match improvement' do
      let(:improvement) { build :improvement }

      it 'raises mismatched playbook error' do
        is_expected.to include match(/not match improvement playbook/)
      end
    end

    context 'when the improvment is advanced' do
      let(:improvement) { build :improvement, :advanced, playbook: hunter.playbook }

      it 'complains the hunter is unqualified' do
        is_expected.to include match(/qualified/)
      end

      context 'when hunter has advanced' do
        let(:improvements) { create_list(:improvement, 5, playbook: hunter.playbook) }

        before { hunter.improvements << improvements }

        it { is_expected.to be_empty }
      end
    end
  end
end
