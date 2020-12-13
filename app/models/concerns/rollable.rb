# frozen_string_literal: true

# This rollable concern extends a move and add rolling functionality
# including using luck on rolls
module Rollable
  extend ActiveSupport::Concern

  included do
    def self.rollable?
      true
    end

    validates :rating, presence: true
  end

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
    Result.new(roll, "Your total #{roll} resulted in #{outcome}")
  end

  def lucky_roll(hunter, lose_experience)
    roll = 12 + hunter.send(rating)
    outcome = outcome(roll, hunter)
    hunter.gain_experience(-1) if lose_experience
    hunter.update(luck: hunter.luck - 1)
    Result.new(roll, "Your total #{roll} resulted in #{outcome}")
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

  Result = Struct.new :roll, :result
end
