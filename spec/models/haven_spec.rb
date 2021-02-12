# == Schema Information
#
# Table name: havens
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute name
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute user_id
#   @return []
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
