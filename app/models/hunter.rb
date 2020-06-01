# frozen_string_literal: true

# The character appearing in the mystery
# == Schema Information
#
# Table name: hunters
#
#  id          :bigint           not null, primary key
#  name        :string
#  harm        :integer
#  luck        :integer
#  experience  :integer
#  charm       :integer
#  cool        :integer
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
#  user_id     :bigint
#
class Hunter < ApplicationRecord
  MAX_LUCK = 7

  belongs_to :playbook
  belongs_to :user

  has_and_belongs_to_many :gears, join_table: :hunters_gears
  accepts_nested_attributes_for :gears

  has_many :hunters_moves
  has_many :moves, through: :hunters_moves
  accepts_nested_attributes_for :moves

  has_many :hunters_improvements
  validates_associated :hunters_improvements,
                       message: lambda { |_class_obj, obj|
                                  obj[:value]&.map { |h_improv| h_improv.errors.full_messages.to_sentence }&.join(', ')
                                }
  has_many :improvements, through: :hunters_improvements

  validates :harm, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }
  validates :luck, numericality: { less_than_or_equal_to: MAX_LUCK, greater_than_or_equal_to: 0 }
  validates :charm, :cool, :sharp, :tough, :weird, presence: true

  # List all improvements that are available
  # based on the hunter's playbook, and excludes
  # improvements the hunter has already taken
  #
  # @return [ActiveRecord::Collection]
  def available_improvements
    availables = playbook.improvements.where.not(id: improvements.select(:id))
    availables = availables.not_advanced unless hunters_improvements.count >= 5
    availables
  end

  # Add a negative or positive amount of experience
  # to the hunter.
  #
  # @param exp [Numeric] the amount of experience to give the player
  def gain_experience(exp)
    self.experience += exp
    save
  end

  # Returns the Hunters Move otherwise known as the object
  # that represents the relationship between the hunter and the move.
  #
  # @param move_id [Move_id] the if of the move
  def hunters_move_for(move_id:)
    hunters_moves.find_by(move_id: move_id)
  end

  # Check whether a move has been advanced by an improvement
  # for this hunter
  #
  # @param move [Move] the move to check
  def advanced?(move)
    !!(hunters_move_for(move_id: move.id)&.advanced)
  end

  # Check whether the hunter has lost enough health to fall unstable
  def unstable?
    harm > 3
  end
end
