# frozen_string_literal: true

# Helper for Improvements
module ImprovementsHelper
  def link_to_improvement(improvement)
    return '' unless improvement
    link_to improvement.description, improvement_path(improvement)
  end
end
