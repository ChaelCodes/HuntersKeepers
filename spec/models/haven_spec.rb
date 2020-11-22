# == Schema Information
#
# Table name: havens
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_havens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Haven, type: :model do
  let(:haven) { build :haven }

  describe 'factory is valid' do
    it { expect(haven).to be_valid }
  end
end
