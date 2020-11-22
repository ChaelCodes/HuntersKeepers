# frozen_string_literal: true

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
FactoryBot.define do
  factory :haven do
    user
    name { 'Mystery Machine' }
    description { 'The van the Scooby Gang rides around in!' }
  end
end
