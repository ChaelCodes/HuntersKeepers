# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
# @!attribute id
#   @return []
# @!attribute charm
#   @return [Integer]
# @!attribute cool
#   @return [Integer]
# @!attribute sharp
#   @return [Integer]
# @!attribute tough
#   @return [Integer]
# @!attribute weird
#   @return [Integer]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
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
