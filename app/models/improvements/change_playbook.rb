module Improvements
  # This improvement changes the hunters playbook
  class ChangePlaybook < Improvement
    def apply(hunters_improvement)
      return false if add_errors(hunters_improvement)

      hunters_improvement.hunter
        .update(playbook: hunters_improvement.improvable)
    end

    def add_errors(hunters_improvement)
      super(hunters_improvement)
      hunters_improvement.errors.add(:improvable, 'is not a Playbook.') unless playbook?(hunters_improvement.improvable)
      hunters_improvement.errors.present?
    end

    def playbook?(playbook)
      playbook.class <= Playbook
    end

    def improvable_options(_hunter)
      Playbook.where.not(id: playbook_id)
    end
  end
end
