# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |i|
      "lala_#{i}@example.com"
    end
    password { '12345678' }
    trait :admin do
      admin { true }
    end
  end
end
