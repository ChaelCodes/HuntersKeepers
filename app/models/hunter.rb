# frozen_string_literal: true

# The character appearing in the mystery
class Hunter < ApplicationRecord
  belongs_to :playbook
  validates :harm, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }
  validates :luck, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }

  def moves
    Moves::Basic.all
  end
end
