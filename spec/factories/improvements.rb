FactoryBot.define do
  factory :improvement do
    description { 'Gain an Ally' }
    type { nil }
  end

  factory :rating_boost, class: Improvements::RatingBoost do
    description { "Get +1 Charm, max +3" }
    type { "Improvements::RatingBoost" }
    rating { 0 }
    stat_limit { 3 }
  end
end
