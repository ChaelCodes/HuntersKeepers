FactoryBot.define do
  factory :user do
    
    sequence :email do |i|
      "lala_#{i}@example.com"
    end
    password {'123456'}
    trait :admin do
      admin {true}
    end

  end
end
