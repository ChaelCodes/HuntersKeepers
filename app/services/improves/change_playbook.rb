# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::ChangePlaybook to a hunter
  # if the hunter is a valid target
  class ChangePlaybook < ::ImproveHunter
    def initialize(hunters_improvement)
      super
      playbook
    end

    def improve
      return false unless valid?
      @hunter.update(playbook: @playbook)
    end

    def valid?
      super
      check :same_playbooks?, :hunter,
            "already is playbook #{@playbook.name}"
      @hunters_improvement.errors.none?
    end

    def same_playbooks?
      @hunter.playbook == @playbook
    end

    def playbook
      @playbook ||= Playbook.find(
        @hunters_improvement.improvable&.dig('playbook', 'id')
      )
    rescue ActiveRecord::RecordNotFound => e
      @hunters_improvement.errors.add(:improvable, e.message)
    end
  end
end
