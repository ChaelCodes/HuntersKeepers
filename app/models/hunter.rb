# frozen_string_literal: true

# The character appearing in the mystery
class Hunter < ApplicationRecord
  belongs_to :playbook
  has_and_belongs_to_many :moves
  validates :harm, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }
  validates :luck, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }

  def hunter_moves
    Move.where(id: moves.select(:id))
        .or(Move.where(type: 'Moves::Basic'))
  end
end
