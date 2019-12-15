# frozen_string_literal: true

# The character appearing in the mystery
class Hunter < ApplicationRecord
  belongs_to :playbook
  has_and_belongs_to_many :gears
  has_and_belongs_to_many :moves
  has_many :hunters_improvements
  validates_associated :hunters_improvements,
                       message: lambda { |_class_obj, obj|
                                  obj[:value]&.map { |h_improv| h_improv.errors.full_messages.to_sentence }&.join(', ')
                                }
  has_many :improvements, through: :hunters_improvements
  validates :harm, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }
  validates :luck, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }

  def hunter_moves
    Move.where(id: moves.select(:id))
        .or(Move.where(type: 'Moves::Basic'))
  end

  def available_improvements
    playbook.improvements.where.not(id: improvements.select(:id))
  end
end
