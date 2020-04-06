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
  # This is for Improvements like "Get back one used Luck point."
  class GainLuck < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)
      hunters_improvement.hunter.luck += 1
      hunters_improvement.hunter.save
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      validate_hunter hunters_improvement
      hunters_improvement.errors.present?
    end

    def validate_hunter(hunters_improvement)
      return unless max_luck?(hunters_improvement.hunter)
      hunters_improvement.errors.add(:hunter, 'already has maximum for luck')
    end

    def max_luck?(hunter)
      hunter.luck >= Hunter::MAX_LUCK
    end
  end
end
