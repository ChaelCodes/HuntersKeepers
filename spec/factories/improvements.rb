# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  description :string
#  type        :string
#  rating      :integer
#  stat_limit  :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  advanced    :boolean
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
