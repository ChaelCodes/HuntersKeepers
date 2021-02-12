# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute haven
#   @return [Boolean]
# @!attribute name
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute seven_to_nine
#   @return [String]
# @!attribute six_and_under
#   @return [String]
# @!attribute ten_plus
#   @return [String]
# @!attribute twelve_plus
#   @return [String]
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
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
FactoryBot.define do
  factory :move do
    type { Moves::Descriptive }
    playbook
    name { 'I’m Here For A Reason' }
    description do
      'There’s something you are
destined to do. Work out the details with the Keeper,
based on your fate. You cannot die until it comes
to pass. If you die in play, then you must spend a
Luck point. You will then, somehow, recover or be
returned to life. Once your task is done (or you use
up all your Luck), all bets are off.'
    end

    trait :haven do
      haven { true }
      playbook { nil }
    end
  end

  factory :moves_basic, class: Moves::Basic do
    type { Moves::Basic }
    name { 'Act Under Pressure' }
    rating { 1 } # Cool
    six_and_under { 'six and under result ' }
    seven_to_nine { 'seven to nine result' }
    ten_plus { 'ten plus result' }
    twelve_plus { 'advanced moves only' }
    description { 'Description' }
  end

  factory :moves_descriptive, class: Moves::Descriptive do
    type { Moves::Descriptive }
    playbook
    name { 'I’m Here For A Reason' }
    description do
      'There’s something you are
destined to do. Work out the details with the Keeper,
based on your fate. You cannot die until it comes
to pass. If you die in play, then you must spend a
Luck point. You will then, somehow, recover or be
returned to life. Once your task is done (or you use
up all your Luck), all bets are off.'
    end
  end

  factory :moves_rollable, class: Moves::Rollable do
    type { Moves::Rollable }
    name { "Destiny's Plaything" }
    description do
      "At the beginning of each
mystery, roll +Weird to see what is revealed about
your immediate future."
    end
    rating { 4 } # Weird
    six_and_under { 'six and under result' }
    seven_to_nine { 'seven to nine result' }
    ten_plus { 'ten plus result' }
    twelve_plus { 'advanced moves only' }
  end
end
