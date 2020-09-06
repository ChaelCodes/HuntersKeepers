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
  let(:hunters_improvement) do
    build :hunters_improvement,
          improvement: change_playbook,
          hunter: hunter,
          improvable: { "id": playbook.id }
  end

  describe '#apply' do
    subject { change_playbook.apply(hunters_improvement) }

    let(:hunters_improvement) do
      build :hunters_improvement,
            improvement: change_playbook,
            hunter: hunter,
            improvable: { playbook: { "id": playbook.id } }
    end
    let(:hunter) { create :hunter, playbook: change_playbook.playbook }
    let(:playbook) { create :playbook }

    it 'gives the hunter a new playbook' do
      expect { subject }.to change(hunter.reload, :playbook).from(hunter.playbook).to(playbook)
    end

    it 'does not invalidate the hunter' do
      subject
      expect(hunter).to be_valid
    end
  end

  describe '#add_errors' do
    subject { change_playbook.add_errors(hunters_improvement) }

    let(:hunter) { create :hunter, playbook: change_playbook.playbook }

    context 'with valid playbook' do
      let(:playbook) { create :playbook }
    end

    context "with hunter's current playbook" do
    end

    context 'with a move instead of a playbook' do
      let(:playbook) { create :move }

      it 'adds errors to improvable' do
        subject
        expect(hunters_improvement.errors.full_messages).to include 'Improvable is not a Playbook.'
      end
    end
  end

  describe '#playbook?' do
    subject { change_playbook.playbook?(playbook) }

    context 'with a playbook' do
      let(:playbook) { create :playbook }

      it { be_truthy }
    end

    context 'with a move' do
      let(:playbook) { create :move }

      it { be_falsey }
    end
  end

  describe '#improvable_options' do
    subject { change_playbook.improvable_options(hunter).dig(:playbook, :data) }

    let(:hunter) { create :hunter, playbook: change_playbook.playbook }
    let!(:playbook) { create :playbook }

    it "does not include the improvement's playbook" do
      is_expected.not_to include change_playbook.playbook
      is_expected.to include playbook
    end
  end
end
