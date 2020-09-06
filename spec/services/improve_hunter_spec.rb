require 'rails_helper'

RSpec.describe ImproveHunter do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) { build(:hunters_improvement, improvement: improvement, hunter: hunter) }
  let(:improvement) { create :improvement }
  let(:hunter) { create :hunter, playbook: improvement.playbook }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    context 'when hunter and improvement playbooks do not match' do
      let(:hunter) { create :hunter }

      it { is_expected.to be_falsey }

      it 'adds error to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include match(/not match improvement playbook/)
      end
    end

    context 'when the improvement is advanced' do
      let(:improvement) { create :improvement, :advanced }

      it { is_expected.to be_falsey }

      it 'complains the hunter is unqualified' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include match(/qualified/)
      end

      context 'when hunter has advanced' do
        let(:improvements) { create_list(:improvement, 5, playbook: hunter.playbook) }

        before { hunter.improvements << improvements }

        it { is_expected.to be_truthy }
      end
    end
  end
end
