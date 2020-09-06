# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { build(:rating) }

  describe 'validate factory' do
    it { expect(rating).to be_valid }
  end
end
