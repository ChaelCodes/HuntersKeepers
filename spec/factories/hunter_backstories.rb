# == Schema Information
#
# Table name: hunter_backstories
#
#  id          :bigint           not null, primary key
#  choices     :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hunter_id   :bigint
#  playbook_id :bigint
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
    choices { {}.to_json }
  end
end
