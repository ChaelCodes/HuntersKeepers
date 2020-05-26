# frozen_string_literal: true

# == Schema Information
#
# Table name: gears
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  harm        :integer
#  armor       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :gear do
    name { 'Sword' }
    description { 'Silver sword' }
    harm { 2 }
    armor { 1 }

    trait :with_tags do
      after(:create) do |gear|
        gear.tag_list = %w[heavy slow]
      end
    end
  end
end
