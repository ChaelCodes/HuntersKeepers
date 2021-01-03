# frozen_string_literal: true

# helper for displaying HunterBackstory
module HunterBackstoriesHelper
  # human-readable title for hunter backstory
  def hunter_backstory_name(hunter_backstory)
    hunter_backstory.playbook.backstory&.dig(:name) || hunter_backstory.id
  end

  # correct model for form
  def hunter_backstory_form_model(hunter_backstory)
    if hunter_backstory.persisted?
      hunter_backstory
    else
      [hunter_backstory.hunter, hunter_backstory]
    end
  end
end
