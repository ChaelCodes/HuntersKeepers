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
