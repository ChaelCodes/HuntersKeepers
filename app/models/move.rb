# frozen_string_literal: true

# Actions that the hunters can take
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

  def roll_results(hunter) # rubocop:disable Metrics/MethodLength
    result = roll(hunter)
    outcome = case result
              when 0..6
                hunter.gain_experience(1)
                six_and_under
              when 7..9
                seven_to_nine
              when (10..)
                ten_plus
              end
    "Your total #{result} resulted in #{outcome}"
  end
end
