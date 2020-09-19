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
FactoryBot.define do
  factory :hunter do
    playbook
    user
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
