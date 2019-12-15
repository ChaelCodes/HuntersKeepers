class Gear < ApplicationRecord
  belongs_to :playbook
  validates :name, presence: true
  acts_as_taggable
end
