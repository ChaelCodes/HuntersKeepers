# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Moves::Basic, type: :model do
  let(:move) { create :moves_basic, rating: :cool }

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
  end
end
