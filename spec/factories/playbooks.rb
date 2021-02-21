# frozen_string_literal: true

# == Schema Information
#
# Table name: playbooks
#
# @!attribute id
#   @return []
# @!attribute backstory
#   @return [Hash]
# @!attribute description
#   @return [String]
# @!attribute luck_effect
#   @return [String]
# @!attribute name
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#
FactoryBot.define do
  factory :playbook do
    name { 'The Nameless' }
    description { 'A nameless playbook for a nameless entity.' }
    luck_effect { 'When you spend a point of Luck, lose a point of luck.' }

    trait :with_backstory do
      backstory {
        {
          name: "Fate",
          headings: [{
                      name: "How you found out.",
                      count: 1,
                      choices: ["Nightmares and visions", "Some weirdo told you."]
                      }]
        }.to_json
      }
    end
  end
end
