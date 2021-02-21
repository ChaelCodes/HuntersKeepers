# frozen_string_literal: true

# The class or playbook that the hunter has
# provides unique abilities to the Hunter
# == Schema Information
#
# Table name: playbooks
#
# @!attribute id
#   @return []
# @!attribute backstory
#   @return [Hash]
# @!attribute description
#   @return [String]
# @!attribute luck_effect
#   @return [String]
# @!attribute name
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#
class Playbook < ApplicationRecord
  has_many :improvements, dependent: :destroy
  has_many :gears, dependent: :destroy
  has_many :moves, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, presence: true

  attribute :backstory, :playbook_config

  def to_s
    name
  end
end
