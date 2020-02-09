# frozen_string_literal: true

module Moves
  class Basic < Move
    def roll_results(hunter) # rubocop:disable Metrics/MethodLength
      result = roll(hunter)
      outcome = case result
                when 0..6
                  hunter.gain_experience(1)
                  six_and_under
                when 7..9
                  seven_to_nine
                when 10..11
                  ten_plus
                else
                  hunter.advanced?(self) ? twelve_plus : ten_plus
                end
      "Your total #{result} resulted in #{outcome}"
    end
  end
end
