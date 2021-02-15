# frozen_string_literal: true

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
FactoryBot.define do
  factory :haven do
    user
    name { 'Mystery Machine' }
    description { 'The van the Scooby Gang rides around in!' }
  end
end
