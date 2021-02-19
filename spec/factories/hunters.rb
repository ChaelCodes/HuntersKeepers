# frozen_string_literal: true

# == Schema Information
#
# Table name: hunters
#
# @!attribute id
#   @return []
# @!attribute charm
#   @return [Integer]
# @!attribute cool
#   @return [Integer]
# @!attribute experience
#   @return [Integer]
# @!attribute harm
#   @return [Integer]
# @!attribute luck
#   @return [Integer]
# @!attribute name
#   @return [String]
# @!attribute retired
#   @return [Boolean]
# @!attribute sharp
#   @return [Integer]
# @!attribute tough
#   @return [Integer]
# @!attribute weird
#   @return [Integer]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
# @!attribute user_id
#   @return []
#
# Indexes
#
#  index_hunters_on_playbook_id  (playbook_id)
#  index_hunters_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :hunter do
    playbook
    user
    name { 'Gon' }
    harm { 0 }
    luck { 7 }
    charm { 1 }
    cool { 2 }
    sharp { 1 }
    tough { 1 }
    weird { -1 }
    experience { 0 }

    trait :retired do
      retired { true }
    end
  end
end
