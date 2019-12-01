require 'rails_helper'

RSpec.describe Hunter, type: :model do
  let(:hunter) { create(:hunter) }

  describe '#available_improvements' do
    subject { hunter.available_improvements }

    context 'improvement outside playbook' do
      let!(:improvement) { create :improvement, playbook: create(:playbook) }

      it { is_expected.not_to include(:improvement) }
    end

    context 'improvement matches hunter playbook' do
      let!(:improvement) { create(:improvement, playbook: hunter.playbook) }

      it { is_expected.to include(improvement) }
      context 'hunter already has improvement' do
        let!(:hunters_improvement) { create(:hunters_improvement, hunter: hunter, improvement: improvement) }

        it { is_expected.not_to include(:improvement) }
      end
    end
  end
end
