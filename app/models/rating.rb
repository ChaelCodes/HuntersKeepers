# frozen_string_literal: true

# The ratings/attributes that the Hunter has
# determines their capability to do something
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
class Rating < ApplicationRecord
  LIST = %i[charm cool sharp tough weird].freeze

  belongs_to :playbook, dependent: :destroy
  validates(*LIST, presence: true, numericality: true)
end
