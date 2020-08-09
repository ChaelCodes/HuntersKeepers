# frozen_string_literal: true

# A Haven is safe space granted to Experts, Flakes, and several other classes
# Havens can be used by other party members, but the moves are only available
# through the Hunter
class Haven < ApplicationRecord
  has_many :hunters_moves, dependent: :nullify
  belongs_to :user

  validates :name, presence: true

  def to_s
    name
  end
end
