# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
# @!attribute id
#   @return []
# @!attribute advanced
#   @return [Boolean]
# @!attribute description
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute stat_limit
#   @return [Integer]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_improvements_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
FactoryBot.define do
  factory :improvement do
    playbook
    description { 'Gain an Ally' }
    type { nil }

    trait :advanced do
      advanced { true }
    end
  end

  factory :advanced_move, class: Improvements::AdvancedMove do
    playbook
    description { 'Mark two of the basic moves as advanced.' }
    type { 'Improvements::AdvancedMove' }
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
    description { 'Get back one used Luck point.' }
    type { 'Improvements::GainLuck' }
  end

  factory :haven_move, class: Improvements::HavenMove do
    playbook
    description { 'Add an option to your haven.' }
    type { 'Improvements::HavenMove' }
  end

  factory :playbook_move, class: Improvements::PlaybookMove do
    playbook
    description { 'Take another Chosen move' }
    type { 'Improvements::PlaybookMove' }
  end

  factory :rating_boost, class: Improvements::RatingBoost do
    playbook
    description { 'Get +1 Charm, max +3' }
    type { 'Improvements::RatingBoost' }
    rating { 0 } # Charm
    stat_limit { 3 }
  end

  factory :retire, class: Improvements::Retire do
    playbook
    description { 'Retire the hunter to safety.' }
    type { 'Improvements::Retire' }
  end
end
