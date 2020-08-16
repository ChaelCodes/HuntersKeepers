# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  description :string
#  type        :string
#  rating      :integer
#  stat_limit  :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  advanced    :boolean
#
module Improvements
  # This is for Improvements like "Get +1 Weird, max +3"
  class RatingBoost < Improvement
    RATINGS_SELECT = { rating: { data: Rating::LIST, count: 1 } }.freeze

    def configured_rating(hunters_improvement)
      rating || hunters_improvement.improvable&.dig('rating')
    end

    def improvable_options(_hunter)
      rating ? {} : RATINGS_SELECT
    end
  end
end
