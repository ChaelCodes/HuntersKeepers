# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#
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
