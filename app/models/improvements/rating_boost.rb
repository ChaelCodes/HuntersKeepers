# frozen_string_literal: true

# == Schema Information
#
# Table name: improvements
#
#  id          :bigint           not null, primary key
#  advanced    :boolean
#  description :string
#  rating      :integer
#  stat_limit  :integer
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
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
