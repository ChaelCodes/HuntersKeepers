# frozen_string_literal: true

# The class or playbook that the hunter has
# provides unique abilities to the Hunter
# == Schema Information
#
# Table name: playbooks
#
#  id          :bigint           not null, primary key
#  backstory   :jsonb
#  description :string
#  luck_effect :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Playbook < ApplicationRecord
  has_many :improvements, dependent: :destroy
  has_many :gears, dependent: :destroy
  has_many :moves, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, presence: true

  self.ignored_columns = [:config]

  def to_s
    name
  end
end
