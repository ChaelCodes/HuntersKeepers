# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    playbook
    charm { 1 }
    cool { -1 }
    sharp { 0 }
    tough { 2 }
    weird { -2 }
  end
end
