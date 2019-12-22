# frozen_string_literal: true

# Gear is equipment that the Hunter can use.
# It is provided by the Playbook.
class Gear < ApplicationRecord
  belongs_to :playbook
  validates :name, presence: true
  acts_as_taggable
end
