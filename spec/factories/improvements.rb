# frozen_string_literal: true

FactoryBot.define do
  factory :improvement do
    playbook
    description { 'Gain an Ally' }
    type { nil }
  end

  factory :rating_boost, class: Improvements::RatingBoost do
    playbook
    description { 'Get +1 Charm, max +3' }
    type { 'Improvements::RatingBoost' }
    rating { 0 } # Charm
    stat_limit { 3 }
  end
end
