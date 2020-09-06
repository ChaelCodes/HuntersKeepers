require 'rails_helper'

RSpec.describe Haven, type: :model do
  let(:haven) { build :haven }

  describe 'factory is valid' do
    it { expect(haven).to be_valid }
  end
end
