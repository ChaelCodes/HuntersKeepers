# frozen_string_literal: true

# == Schema Information
#
# Table name: hunters
#
#  id          :bigint           not null, primary key
#  name        :string
#  harm        :integer
#  luck        :integer
#  experience  :integer
#  charm       :integer
#  cool        :integer
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
#  user_id     :bigint
#
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
        it { is_expected.to include(improvement) }
      end

      context 'hunter has 5 improvements' do
        let!(:improvements) do
          create_list(:improvement,
                      5,
                      playbook: hunter.playbook)
        end

        before { hunter.improvements << improvements }

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

  describe '#rating_id=' do
    subject(:set_rating) { hunter.rating_id = rating.id }

    let(:rating) { create :rating, playbook: hunter.playbook }

    it 'sets the hunters stats to equal the rating' do
      set_rating
      expect(hunter).to have_attributes(
        charm: rating.charm,
        cool: rating.cool,
        sharp: rating.sharp,
        tough: rating.tough,
        weird: rating.weird
      )
    end

    context 'with missing rating' do
      let(:rating) { build :rating, playbook: hunter.playbook }

      it 'raises error' do
        expect { set_rating }.to raise_error(ActiveRecord::RecordNotFound)
      end
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
      it { is_expected.to eq false }
    end
  end

  describe '#unstable?' do
    subject { hunter.unstable? }

    context 'hunter has more than 3 harm' do
      let(:hunter) { create :hunter, harm: 4 }

      it { is_expected.to be_truthy }
    end

    context 'hunter has less than 3 harm' do
      let(:hunter) { create :hunter, harm: 3 }

      it { is_expected.to be_falsey }
    end
  end
end
