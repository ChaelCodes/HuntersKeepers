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
  # This improvement retires the hunter to safety
  class Retire < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)

      hunters_improvement.hunter.update!(retired: true)
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      if hunters_improvement.hunter.retired?
        hunters_improvement.errors.add(:hunter, 'has already retired.')
      end
      hunters_improvement.errors.present?
    end
  end
end
