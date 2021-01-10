# frozen_string_literal: true

# == Schema Information
#
# Table name: playbooks
#
#  id          :bigint           not null, primary key
#  config      :jsonb
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# The class or playbook that the hunter has
# provides unique abilities to the Hunter
class Playbook < ApplicationRecord
  has_many :improvements, dependent: :destroy
  has_many :gears, dependent: :destroy
  has_many :moves, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, presence: true

  def to_s
    name
  end

  def backstory
    return nil unless config
    JSON.parse(config)['backstory'].with_indifferent_access
  end
end
