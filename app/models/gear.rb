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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Gear < ApplicationRecord
  has_many :playbook_gears, dependent: :destroy
  has_many :playbooks, through: :playbook_gears

  validates :name, presence: true
  acts_as_taggable
end
