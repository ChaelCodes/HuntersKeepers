# frozen_string_literal: true

# == Schema Information
#
# Table name: hunters
#
#  id          :bigint           not null, primary key
#  charm       :integer
#  cool        :integer
#  experience  :integer
#  harm        :integer
#  luck        :integer
#  name        :string
#  retired     :boolean
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_hunters_on_playbook_id  (playbook_id)
#  index_hunters_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :hunter do
    playbook
    user
    name { 'Gon' }
    harm { 0 }
    luck { 7 }
    charm { 1 }
    cool { 2 }
    sharp { 1 }
    tough { 1 }
    weird { -1 }
    experience { 0 }

    trait :retired do
      retired { true }
    end
  end
end
