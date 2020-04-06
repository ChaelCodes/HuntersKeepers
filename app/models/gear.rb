# frozen_string_literal: true

# == Schema Information
#
# Table name: gears
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  harm        :integer
#  armor       :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Gear is equipment that the Hunter can use.
# It is provided by the Playbook.
class Gear < ApplicationRecord
  belongs_to :playbook
  validates :name, presence: true
  acts_as_taggable
end
