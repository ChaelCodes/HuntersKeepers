require 'rails_helper'

RSpec.describe Improves::RatingBoost do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build(:hunters_improvement,
      improvement: improvement,
      hunter: hunter,
      improvable: improvable)
    end
  let(:improvable) { nil}
  let(:improvement) { create :rating_boost }
  let(:hunter) { create :hunter, playbook: improvement.playbook, charm: 2, cool: 0 }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }
    it { expect { subject }.to change(hunter, :charm).by(1) }

    context 'with configured rating boost' do
      let(:improvement) { create :rating_boost, rating: nil }
      let(:improvable) { { rating: 'cool' } }

      it { expect { improve }.to change(hunter, :cool).by(1) }

      it "sets the hunter's cool to 1" do
        improve
        expect(hunter.cool).to eq 1
      end
    end

    context 'with invalid hunter' do
      let(:hunter) { create :hunter, charm: 3 }

      it { is_expected.to be_falsey }

      it 'applies errors to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages).to include 'Hunter charm rating would exceed max for improvement.'
      end
    end
  end

  describe '#valid?' do
    subject { improve_hunter.valid? }

    it { is_expected.to be_truthy }

    context 'hunter with max rating' do
      let(:hunter) { create :hunter, playbook: improvement.playbook, charm: 3 }

      it { is_expected.to be_falsey }
    end
  end

  describe '#under_max_limit?' do
    subject { improve_hunter.under_max_limit? }

    it { is_expected.to be_truthy }

    context 'hunter with max rating' do
      let(:hunter) { create :hunter, playbook: improvement.playbook, charm: 3 }

      it { is_expected.to be_falsey }
    end
  end
end
