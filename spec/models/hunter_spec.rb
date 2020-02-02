require 'rails_helper'

RSpec.describe Hunter, type: :model do
  let(:hunter) { create(:hunter) }

  describe '#available_improvements' do
    subject { hunter.available_improvements }

    context 'improvement outside playbook' do
      let!(:improvement) { create :improvement, playbook: create(:playbook) }

      it { is_expected.not_to include(improvement) }
    end

    context 'improvement matches hunter playbook' do
      let!(:improvement) { create(:improvement, playbook: hunter.playbook) }

      it { is_expected.to include(improvement) }
      context 'hunter already has improvement' do
        let!(:hunters_improvement) { create(:hunters_improvement, hunter: hunter, improvement: improvement) }

        it { is_expected.not_to include(improvement) }
      end
    end

    context 'for advanced improvements' do
      let!(:advanced_improvement) { create(:improvement, advanced: true, playbook: hunter.playbook) }
      let!(:improvement) { create :improvement, playbook: hunter.playbook }

      context 'hunter has no improvements' do
        it { is_expected.not_to include(advanced_improvement) }
      end

      context 'hunter has 5 improvements' do
        let!(:hunters_improvements) do
          create_list(:hunters_improvement,
                      5,
                      hunter: hunter,
                      playbook: hunter.playbook)
        end

        it { is_expected.to include(advanced_improvement) }
      end
    end
  end

  describe '#gain_experience' do
    subject { hunter.gain_experience(exp) }

    let(:exp) { 1 }
    it 'increases the hunter experience' do
      expect { subject }.to change(hunter.reload, :experience).by(1)
      expect(hunter.reload.experience).to eq 1
    end
  end

  describe '#advanced?' do
    subject { hunter.advanced?(move) }
    let(:move) { create(:move) }

    context 'with advanced move' do
      let!(:hunter_move) { create(:hunters_move, hunter: hunter, move: move, advanced: true) }

      it { is_expected.to be_truthy }
    end

    context 'with not advanced move' do
      let!(:hunter_move) { create(:hunters_move, hunter: hunter, move: move) }

      it { is_expected.to be_falsey }
    end
  end
end
