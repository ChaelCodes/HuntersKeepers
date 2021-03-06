# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
# @!attribute id
#   @return []
# @!attribute advanced
#   @return [Boolean]
# @!attribute description
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute stat_limit
#   @return [Integer]
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
#  index_improvements_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
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
