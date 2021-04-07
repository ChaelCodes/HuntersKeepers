# frozen_string_literal: true

# The character appearing in the mystery

# == Schema Information
#
# Table name: hunters
#
# @!attribute id
#   @return []
# @!attribute charm
#   @return [Integer]
# @!attribute cool
#   @return [Integer]
# @!attribute experience
#   @return [Integer]
# @!attribute harm
#   @return [Integer]
# @!attribute luck
#   @return [Integer]
# @!attribute name
#   @return [String]
# @!attribute retired
#   @return [Boolean]
# @!attribute sharp
#   @return [Integer]
# @!attribute tough
#   @return [Integer]
# @!attribute weird
#   @return [Integer]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
# @!attribute user_id
#   @return []
#
# Indexes
#
#  index_hunters_on_playbook_id  (playbook_id)
#  index_hunters_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#  fk_rails_...  (user_id => users.id)
#
class Hunter < ApplicationRecord
  MAX_LUCK = 7

  belongs_to :playbook
  belongs_to :user

  has_one :hunter_backstory, dependent: :destroy

  has_and_belongs_to_many :gears, join_table: :hunters_gears
  accepts_nested_attributes_for :gears

  has_many :hunters_moves, dependent: :destroy
  has_many :moves, through: :hunters_moves
  accepts_nested_attributes_for :moves

  has_many :hunters_improvements, dependent: :destroy
  validates_associated :hunters_improvements,
                       message: lambda { |_class_obj, obj|
                                  obj[:value]&.map { |h_improv| h_improv.errors.full_messages.to_sentence }&.join(', ')
                                }
  has_many :improvements, through: :hunters_improvements

  validates :harm, numericality: { less_than_or_equal_to: 7, greater_than_or_equal_to: 0 }
  validates :luck, numericality: { less_than_or_equal_to: MAX_LUCK, greater_than_or_equal_to: 0 }
  validates :charm, :cool, :sharp, :tough, :weird, presence: true
  after_create :add_defaults

  # This is the Pundit Policy that governs Hunter access
  #
  # @see HunterPolicy
  def self.policy_class
    HunterPolicy
  end

  # List all improvements that are available
  # based on the hunter's playbook, and excludes
  # improvements the hunter has already taken,
  # and excludes advanced improvement if the
  # hunter does not qualify
  #
  # @return [ActiveRecord::Collection]
  def available_improvements
    availables = playbook.improvements.where.not(id: improvements.select(:id))
    unless Improvement.advanced_eligible?(self)
      availables = availables.not_advanced
    end
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
  # @param move_id [Move_id] the id of the move
  def hunters_move_for(move_id:)
    hunters_moves.find_by(move_id: move_id)
  end

  # Transitions the Hunter to a retired state
  def retire!
    update!(retired: true)
  end

  # Sets the Hunter's stats to those of the rating.
  # Intended for use in creating the Hunter.
  #
  # @param rating [Rating] the hunter will assume these stats
  def rating=(rating)
    rate_attrs = rating.attributes.with_indifferent_access.slice(*Rating::LIST)
    assign_attributes(rate_attrs)
  end

  # Sets the Hunter's stats to those of the rating.
  # Intended for use in creating the Hunter.
  #
  # @param rating [Rating] the hunter will assume these stats
  def rating_id=(rating_id)
    self.rating = Rating.find rating_id
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

  def to_s
    name
  end

  def add_defaults
    self.moves = Moves::Basic.where(name: Moves::Basic.default_moves) if moves.empty?
  end
end
