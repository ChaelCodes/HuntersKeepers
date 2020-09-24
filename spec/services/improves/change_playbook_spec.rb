# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improves::ChangePlaybook do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build(:hunters_improvement,
          improvement: improvement,
          hunter: hunter,
          improvable: improvable)
  end
  let(:improvable) { { playbook: playbook } }
  let(:improvement) { create :change_playbook }
  let(:hunter) do
    create :hunter, playbook: improvement.playbook
  end
  let(:playbook) { create :playbook }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    it 'updates the playbook' do
      expect { improve }.to change(hunter, :playbook)
        .from(improvement.playbook).to(playbook)
    end

    it 'does not invalidate the hunter' do
      improve
      expect(hunter).to be_valid
    end

    context 'with invalid hunter' do
      let(:playbook) { hunter.playbook }

      it { is_expected.to be_falsey }

      it 'applies errors to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include "Hunter already is playbook #{playbook.name}"
      end
    end
  end

  describe '#valid?' do
    subject { improve_hunter.valid? }

    it { is_expected.to be_truthy }

    context 'when hunter is same playbook as improvable' do
      let(:playbook) { hunter.playbook }

      it { is_expected.to be_falsey }
    end
  end

  describe '#same_playbook?' do
    subject { improve_hunter.same_playbooks? }

    it { is_expected.to be_falsey }

    context 'when hunter playbook matches improvable playbook' do
      let(:playbook) { hunter.playbook }

      it { is_expected.to be_truthy }
    end
  end
end
