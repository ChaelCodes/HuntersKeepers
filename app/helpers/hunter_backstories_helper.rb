module HunterBackstoriesHelper
  def hunter_backstory_name(hunter_backstory)
    hunter_backstory.playbook.backstory&.dig(:name) || hunter_backstory.id
  end
end
