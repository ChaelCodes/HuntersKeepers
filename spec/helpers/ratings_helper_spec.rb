# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RatingsHelper.
RSpec.describe RatingsHelper, type: :helper do
  describe '#display_rating' do
    subject { helper.display_rating(rating) }

    let(:rating) do
      build(:rating,
            charm: 1, cool: -1, sharp: 0, tough: 2, weird: -2)
    end

    it { is_expected.to eq 'Charm +1, Cool -1, Sharp +0, Tough +2, Weird -2' }
  end
end
