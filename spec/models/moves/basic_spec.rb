# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute haven
#   @return [Boolean]
# @!attribute name
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute seven_to_nine
#   @return [String]
# @!attribute six_and_under
#   @return [String]
# @!attribute ten_plus
#   @return [String]
# @!attribute twelve_plus
#   @return [String]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
require 'rails_helper'

RSpec.describe Moves::Basic, type: :model do
  let(:move) { build :moves_basic, rating: :cool }

  describe 'validate factory' do
    it { expect(move).to be_valid }

    context 'without rating' do
      let(:move) { build :moves_basic, rating: nil }

      it { expect(move).not_to be_valid }
    end
  end

  describe '::rollable?' do
    subject { described_class.rollable? }

    it { is_expected.to eq true }
  end

  describe '#roll_results' do
    subject { move.roll_results(hunter) }

    let(:hunter) { create :hunter, cool: 1 }

    before { allow_any_instance_of(Random).to receive(:rand).and_return(roll_result) }

    context 'hunter has advanced move and rolled a 12' do
      let(:roll_result) { 12 }

      it 'returns advanced result' do
        expect(hunter).to receive(:advanced?).and_return(true)
        expect(move.twelve_plus).to eq 'advanced moves only'
        expect(subject.result).to eq "Your total 13 resulted in #{move.twelve_plus}"
      end
    end

    context 'roll is 5' do
      let(:roll_result) { 5 }

      it 'catches the top boundary of failure' do
        expect(subject.roll).to eq 6
        expect(subject.result).to eq "Your total 6 resulted in #{move.six_and_under}"
      end
    end

    context 'roll is 7' do
      let(:roll_result) { 7 }

      it 'returns 7-9 if value is in the middle' do
        expect(subject.roll).to eq 8
        expect(subject.result).to eq "Your total 8 resulted in #{move.seven_to_nine}"
      end
    end

    context 'roll is 9' do
      let(:roll_result) { 9 }

      it 'return 10+ on the bottom boundary' do
        expect(subject.roll).to eq 10
        expect(subject.result).to eq "Your total 10 resulted in #{move.ten_plus}"
      end
    end

    context 'roll is 12' do
      let(:roll_result) { 12 }

      it { expect(subject.result).to eq "Your total 13 resulted in #{move.ten_plus}" }
    end
  end

  describe '#roll' do
    subject { move.roll(hunter) }

    let(:move) { build :moves_basic, rating: :cool }
    let(:hunter) { build :hunter }

    before { allow_any_instance_of(Random).to receive(:rand).and_return(1) }

    it { is_expected.to eq hunter.cool + 1 }
  end

  describe '.default_moves' do
    subject { described_class.default_moves }

    let(:default_moves) do
      [
        'Manipulate Someone',
        'Act Under Pressure',
        'Help Out',
        'Investigate a Mystery',
        'Read a Bad Situation',
        'Kick some Ass',
        'Protect Someone',
        'Use Magic'
      ]
    end

    it { is_expected.to eq default_moves }
  end
end
