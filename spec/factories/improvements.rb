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

  factory :playbook_move, class: Improvements::PlaybookMove do
    playbook
    description { 'Take another Chosen move' }
    type { 'Improvements::PlaybookMove' }
  end


  factory :another_move, class: Improvements::AnotherMove do
    playbook
    description { 'Take a move from another Playbook' }
    type { 'Improvements::AnotherMove' }
  end

  factory :change_playbook, class: Improvements::ChangePlaybook do
    playbook
    description { 'Change this hunter to a new type.' }
    type { 'Improvements::ChangePlaybook' }
  end

  factory :gain_luck, class: Improvements::GainLuck do
    playbook
    description { 'Get back one used Luck point.'}
    type { 'Improvements::GainLuck' }
  end
end
