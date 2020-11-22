# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  charm       :integer
#  cool        :integer
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
#
# Indexes
#
#  index_ratings_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
FactoryBot.define do
  factory :rating do
    playbook
    charm { 1 }
    cool { -1 }
    sharp { 0 }
    tough { 2 }
    weird { -2 }
  end
end
