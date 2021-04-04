# frozen_string_literal: true

# Actions that the hunters can take
# == Schema Information
#
# Table name: moves
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute haven
#   @return [Boolean]
# @!attribute name
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute seven_to_nine
#   @return [String]
# @!attribute six_and_under
#   @return [String]
# @!attribute ten_plus
#   @return [String]
# @!attribute twelve_plus
#   @return [String]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
class Move < ApplicationRecord
  MOVE_TYPES = %w[Moves::Basic Moves::Rollable Moves::Descriptive].freeze

  belongs_to :playbook, optional: true
  has_many :hunters_moves, dependent: :destroy
  has_many :hunters, through: :hunters_moves

  scope :not_basic, -> { where.not(type: 'Moves::Basic') }
  scope :with_hunter, ->(hunter_id) do # rubocop:disable Style/Lambda
    includes(:hunters)
      .where(hunters: { id: hunter_id })
  end
  scope :include_hunter_moves, ->(hunter_id) do # rubocop:disable Style/Lambda
    query = %(LEFT JOIN hunters_moves on
              hunters_moves.hunter_id = #{hunter_id}
              AND moves.id = hunters_moves.move_id)
    includes(:hunters_moves)
      .joins(query)
  end
  scope :haven, -> { where(haven: true) }

  validates :type, inclusion: { in: MOVE_TYPES }
  validates :name, presence: true
  validates :description, presence: true

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  def rollable?
    false
  end

  # This is the Pundit Policy that governs Move access
  #
  # @see MovePolicy
  def self.policy_class
    MovePolicy
  end
end
