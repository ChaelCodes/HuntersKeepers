# frozen_string_literal: true

# Actions that the hunters can take
class Move < ApplicationRecord
  MOVE_TYPES = %w[Moves::Basic].freeze

  validates :type, inclusion: { in: MOVE_TYPES }

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  def roll(hunter)
    Random.new.rand(2..12) + hunter.send(rating)
  end

  def roll_results(hunter) # rubocop:disable Metrics/MethodLength
    result = roll(hunter)
    outcome = case result
              when 0..6
                six_and_under
              when 7..9
                seven_to_nine
              when 10..11
                ten_plus
              else
                # TODO: Add advanced Moves logic
                ten_plus
              end
    "Your total #{result} resulted in #{outcome}"
  end
end
