# == Schema Information
#
# Table name: gears
#
#  id          :bigint           not null, primary key
#  armor       :integer
#  description :string
#  harm        :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
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
      end
    end
  end
end
