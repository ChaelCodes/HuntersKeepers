# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improvements::GainLuck, type: :model do
  let(:gain_luck) { create(:gain_luck) }
  let(:hunters_improvement) { build :hunters_improvement, hunter: hunter, improvement: gain_luck }
  let(:hunter) { create :hunter, playbook: gain_luck.playbook, luck: 1 }

  describe '#apply' do
    subject { gain_luck.apply(hunters_improvement) }

    it "increases the hunter's luck by 1" do
      subject
      expect(hunter.reload.luck).to eq 2
    end

    context 'hunter already has maximum luck' do
      let(:hunter) { create :hunter, playbook: gain_luck.playbook, luck: Hunter::MAX_LUCK }

      it 'adds errors to hunters improvement' do
        subject
        expect(hunters_improvement.errors.full_messages).to include('Hunter already has maximum for luck')
      end

      it 'does not set luck to 8' do
        subject
        expect(hunter.reload.luck).to eq Hunter::MAX_LUCK
      end
    end
  end
end
