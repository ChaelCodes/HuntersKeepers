# frozen_string_literal: true

FactoryBot.define do
  factory :haven do
    user
    name { 'Mystery Machine' }
    description { 'The van the Scooby Gang rides around in!' }
  end
end
