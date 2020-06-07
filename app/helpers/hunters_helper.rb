# frozen_string_literal: true

# Hunters Helper
module HuntersHelper
  def link_to_hunter(hunter)
    link_to(hunter.name, hunter)
  end
end
