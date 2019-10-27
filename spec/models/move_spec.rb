# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:move) { create :move }

  describe '#roll' do
    subject { move.roll(hunter) }
    let(:hunter) { create :hunter }
    before { allow_any_instance_of(Random).to receive(:rand).and_return(1) }

    it { is_expected.to eq hunter.cool + 1 }
  end

  describe '#roll_results' do
    subject { move.roll_results(hunter) }
    let(:hunter) { create :hunter, cool: 1 }
    before { allow_any_instance_of(Random).to receive(:rand).and_return(roll_result) }

    context 'roll is 5' do
      let(:roll_result) { 5 }

      it {
        is_expected.to eq "Your total 6 resulted in #{move.six_and_under}"
      }
    end

    context 'roll is 7' do
      let(:roll_result) { 7 }

      it { is_expected.to eq "Your total 8 resulted in #{move.seven_to_nine}" }
    end

    context 'roll is 9' do
      let(:roll_result) { 9 }

      it { is_expected.to eq "Your total 10 resulted in #{move.ten_plus}" }
    end

    context 'roll is 11' do
      let(:roll_result) { 10 }

      it { is_expected.to eq "Your total 11 resulted in #{move.ten_plus}" }
    end
  end

  describe '#rollable?' do
    subject { move.rollable? }

    it { is_expected.to be_truthy }
  end
end
