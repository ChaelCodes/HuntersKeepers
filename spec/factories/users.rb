# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
# @!attribute id
#   @return []
# @!attribute admin
#   @return [Boolean]
# @!attribute banned_at
#   @return [Time]
# @!attribute confirmation_sent_at
#   @return [Time]
# @!attribute confirmation_token
#   @return [String]
# @!attribute confirmed_at
#   @return [Time]
# @!attribute email
#   @return [String]
# @!attribute encrypted_password
#   @return [String]
# @!attribute remember_created_at
#   @return [Time]
# @!attribute reset_password_sent_at
#   @return [Time]
# @!attribute reset_password_token
#   @return [String]
# @!attribute unconfirmed_email
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence :email do |i|
      "lala_#{i}@example.com"
    end
    password { '12345678' }
    confirmed_at { Time.zone.now }

    trait :admin do
      admin { true }
    end

    trait :banned do
      banned_at { Time.zone.now }
    end

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
