# frozen_string_literal: true

# Actions that the hunters can take
# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  name          :string
#  rating        :integer
#  six_and_under :string
#  seven_to_nine :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#  description   :string
#
class Move < ApplicationRecord
  MOVE_TYPES = %w[Moves::Basic Moves::Rollable Moves::Descriptive].freeze

  belongs_to :playbook, optional: true
  has_many :hunters_moves

  scope :not_basic, -> { where.not(type: 'Moves::Basic') }
  scope :with_hunter_moves, (lambda do |hunter_id|
    includes(:hunters_moves)
      .where(hunters_moves: { hunter_id: [hunter_id, nil] })
  end)

  validates :type, inclusion: { in: MOVE_TYPES }

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  def rollable?
    true
  end

  def roll(hunter)
    Random.new.rand(2..12) + hunter.send(rating)
  end

  def roll_results(hunter)
    roll = roll(hunter)
    outcome = outcome(roll, hunter)
    hunter.gain_experience(1) if roll <= 6
    RollResult.new(roll, "Your total #{roll} resulted in #{outcome}")
  end

  def lucky_roll(hunter, lose_experience)
    roll = 12 + hunter.send(rating)
    outcome = outcome(roll, hunter)
    hunter.gain_experience(-1) if lose_experience
    RollResult.new(roll, "Your total #{roll} resulted in #{outcome}")
  end

  def outcome(roll, _hunter)
    case roll
    when 0..6
      six_and_under
    when 7..9
      seven_to_nine
    when (10..)
      ten_plus
    end
  end

  RollResult = Struct.new :roll, :result
end
