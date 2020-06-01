# frozen_string_literal: true

# Gear is equipment that the Hunter can use.
# Gear includes tags (through the acts_as_taggable_on gem), which are used
# by the Keeper and Hunter and are visible to users and keywords, which are used
# to distinguish different sets of gear that might
# have different numbers of selectable gear, such as with The Flake, who can
# have one 'normal' weapon and two 'hidden' weapons.  Keywords can also be used
# to reference modes of transport using the keyword 'transport'.

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
class Gear < ApplicationRecord
  has_many :playbook_gears, dependent: :destroy
  has_many :playbooks, through: :playbook_gears

  validates :name, presence: true
  acts_as_taggable_on :tags, :keywords
end
