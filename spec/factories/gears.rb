# == Schema Information
#
# Table name: gears
#
# @!attribute id
#   @return []
# @!attribute armor
#   @return [Integer]
# @!attribute description
#   @return [String]
# @!attribute harm
#   @return [Integer]
# @!attribute name
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
#  index_gears_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
FactoryBot.define do
  factory :gear do
    name { "Sword" }
    description { "Silver sword" }
    harm { 2 }
    armor { 1 }
    playbook

    trait :with_tags do
      after(:create) do |gear|
        gear.tag_list = %w(heavy slow)
        gear.save
      end
    end
  end
end
