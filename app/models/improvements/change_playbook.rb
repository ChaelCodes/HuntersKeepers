# frozen_string_literal: true

module Improvements
  # This improvement changes the hunters playbook
  class ChangePlaybook < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)

      hunters_improvement
        .hunter
        .update(playbook: new_playbook(hunters_improvement))
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      hunters_improvement.errors.add(:improvable, 'is not a Playbook.') unless playbook?(new_playbook(hunters_improvement))
      hunters_improvement.errors.present?
    end

    def playbook?(playbook)
      playbook.class <= Playbook
    end

    def improvable_options(_hunter)
      Playbook.where.not(id: playbook_id).select(:id, :name, :description)
    end

    def new_playbook(hunters_improvement)
      begin
        Playbook.find(hunters_improvement.improveable&.dig('id'))
      rescue ActiveRecord::RecordNotFound => e
        hunters_improvement.errors.add(:improveable, e.message)
      end
    end
  end
end
