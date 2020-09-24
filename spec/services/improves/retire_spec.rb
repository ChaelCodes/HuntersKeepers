# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Improves::Retire do
  let(:improve_hunter) { described_class.new(hunters_improvement) }
  let(:hunters_improvement) do
    build(:hunters_improvement,
          improvement: improvement,
          hunter: hunter,
          improvable: nil)
  end
  let(:improvement) { create :retire }
  let(:hunter) { create :hunter, playbook: improvement.playbook }

  describe '#improve' do
    subject(:improve) { improve_hunter.improve }

    it { is_expected.to be_truthy }

    it 'increments luck' do
      expect { improve }.to change(hunter, :retired)
        .from(nil).to(true)
    end

    context 'when hunter is retired' do
      let(:hunter) { create :hunter, :retired, playbook: improvement.playbook }

      it { is_expected.to be_falsey }

      it 'applies errors to hunters improvement' do
        improve
        expect(hunters_improvement.errors.full_messages)
          .to include 'Hunter is already retired'
      end
    end
  end

  describe '#valid?' do
    subject { improve_hunter.valid? }

    it { is_expected.to be_truthy }

    context 'when hunter is retired' do
      let(:hunter) { create :hunter, :retired, playbook: improvement.playbook }

      it { is_expected.to be_falsey }
    end
  end

  describe '#retired?' do
    subject { improve_hunter.retired? }

    it { is_expected.to be_falsey }

    context 'when hunter is retired' do
      let(:hunter) { create :hunter, :retired, playbook: improvement.playbook }

      it { is_expected.to be_truthy }
    end
  end
end
