# == Schema Information
#
# Table name: hunter_backstories
#
# @!attribute id
#   @return []
# @!attribute choices
#   @return [Hash]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute hunter_id
#   @return []
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_hunter_backstories_on_hunter_id    (hunter_id)
#  index_hunter_backstories_on_playbook_id  (playbook_id)
#
FactoryBot.define do
  factory :hunter_backstory do
    hunter
    playbook
    choices { {} }

    trait 'with_choices' do
      choices { [{ name: 'How you found out', choices: ['Some weirdo told you']}] }
    end
  end
end
