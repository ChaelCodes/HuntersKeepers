# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GearsHelper. For example:
#
# describe GearsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GearsHelper, type: :helper do
  describe '#gear_display_tags' do
    subject { helper.gear_display_tags(gear) }

    let(:gear) { create(:gear, :with_tags) }

    it { is_expected.to eq '(2-harm 1-armor heavy slow)' }

    context 'gear without tags' do
      let(:gear) { build(:gear, harm: 0, armor: 0) }

      it { is_expected.to eq '' }
    end
  end

  describe 'link_to_gear' do
    subject { helper.link_to_gear(gear) }

    let(:gear) { build :gear }

    it 'links to gear' do
      expect(subject).to eq '<a href="/gears">Sword</a>'
    end

    context 'persisted gear' do
      let(:gear) { create :gear }

      it 'links to the specific gear' do
        expect(subject).to eq %(<a href="/gears/#{gear.id}">#{gear.name}</a>)
      end
    end
  end
end
