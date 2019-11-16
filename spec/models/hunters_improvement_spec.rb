# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HuntersImprovement, type: :model do
  let(:hunters_improvement) { create :hunters_improvement }

  describe '#create' do
    let(:hunter) { create :hunter }
    let(:improvement) { create :improvement }

    subject do
      hunter.improvements << improvement
      hunter.save
    end

    it 'applies the improvement to the hunter' do
      subject
      expect(hunter.improvements).to include(improvement)
    end

    context 'hunter hits max from improvement' do
      let(:improvement) { create(:rating_boost, rating: 0, stat_limit: 3) }
      let(:hunter) { create :hunter, charm: 2 }

      it 'hunter improvement is still valid' do
        expect { subject }.to change(hunter, :charm).from(2).to(3)
        hunters_improvement = hunter.hunters_improvements.last
        expect(hunters_improvement).to be_valid
        expect(hunter).to be_valid
      end
    end

    context 'hunter does not pass improvement validations' do
      let(:errors) { ['Rating would exceed max for improvement.'] }

      before do
        allow(improvement).to receive(:valid_hunter?).and_return(false)
        allow(improvement).to receive(:hunter_errors).and_return(errors)
      end

      it 'shows errors' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        hunters_improvement = hunter.hunters_improvements.last
        expect(hunters_improvement).not_to be_valid
        expect(hunters_improvement.errors.full_messages).to include("Hunter #{errors.first}")
        expect(hunter).not_to be_valid
        expect(hunter.errors.full_messages.to_sentence).to include(errors.first)
      end
    end

    context 'improvement already exists on hunter' do
      subject { HuntersImprovement.create(hunter: hunter, improvement: improvement) }

      let!(:hunt_improv) { HuntersImprovement.create(hunter: hunter, improvement: improvement) }

      it 'does not add improvement again' do
        expect(subject).not_to be_valid
        expect(hunter.improvements.count).to eq 1
      end
    end
  end

  describe '#apply_improvement' do
    subject { hunters_improvement.apply_improvement }

    let(:improvement) { create(:rating_boost, rating: :charm, stat_limit: 3) }
    let(:hunters_improvement) { build(:hunters_improvement, improvement: improvement, hunter: hunter) }

    context 'valid hunter' do
      let(:hunter) { create(:hunter, charm: -1) }

      it 'boosts the stat of the hunter' do
        expect { subject }.to change(hunters_improvement.hunter.reload, :charm).by(1)
      end
    end

    context 'invalid hunter' do
      let(:hunter) { create(:hunter, charm: 3) }

      it 'adds the errors to the hunter_improvement' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(hunters_improvement).not_to be_valid
        expect(hunters_improvement.errors.full_messages).to include('Hunter')
      end
    end
  end

  describe '#add_errors_from_improvement' do
    subject { hunters_improvement.add_errors_from_improvement }

    let(:hunter) { create(:hunter, charm: 3) }
    let(:improvement) { create(:rating_boost, rating: :charm, stat_limit: 3) }
    let(:hunters_improvement) { build(:hunters_improvement, improvement: improvement, hunter: hunter) }

    it 'adds the errors to the hunter improvement' do
      subject
      expect(hunters_improvement.errors.full_messages).to include('Hunter charm rating would exceed max for improvement.')
    end
  end
end
