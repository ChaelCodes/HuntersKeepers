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

RSpec.describe Moves::Rollable, type: :model do
  let(:rollable) { build(:moves_rollable) }

  describe 'factory is valid' do
    it { expect(rollable).to be_valid }

    it { expect(rollable).to be_rollable }
  end

  describe '#roll' do
    subject { rollable.roll(hunter) }

    let(:hunter) { create :hunter }

    before { allow_any_instance_of(Random).to receive(:rand).and_return(1) }

    it { is_expected.to eq hunter.weird + 1 }
  end

  describe '#roll_results' do
    subject { rollable.roll_results(hunter).result }

    let(:hunter) { create :hunter, weird: 1 }

    before { allow_any_instance_of(Random).to receive(:rand).and_return(roll_result) }

    context 'when roll is 5' do
      let(:roll_result) { 5 }

      it {
        expect(subject).to eq "Your total 6 resulted in #{rollable.six_and_under}"
      }
    end

    context 'when roll is 7' do
      let(:roll_result) { 7 }

      it { expect(subject).to eq "Your total 8 resulted in #{rollable.seven_to_nine}" }
    end

    context 'when roll is 9' do
      let(:roll_result) { 9 }

      it { expect(subject).to eq "Your total 10 resulted in #{rollable.ten_plus}" }
    end

    context 'when roll is 11' do
      let(:roll_result) { 10 }

      it { expect(subject).to eq "Your total 11 resulted in #{rollable.ten_plus}" }
    end

    context 'when roll is 13' do
      let(:roll_result) { 13 }

      it { expect(subject).to eq "Your total 14 resulted in #{rollable.ten_plus}" }
    end
  end
end
