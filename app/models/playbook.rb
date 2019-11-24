# frozen_string_literal: true

# The class or playbook that the hunter has
# provides unique abilities to the Hunter
class Playbook < ApplicationRecord
  has_many :improvements
  has_many :moves
  has_many :ratings, dependent: :destroy
end
