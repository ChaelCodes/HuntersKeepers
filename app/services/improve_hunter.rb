# frozen_string_literal: true

class ImproveHunter
  def self.for(improvement)
    return ImproveHunter unless improvement.type
    improvement.type.gsub('Improvements', 'Improves').constantize
  end

  def initialize(hunters_improvement)
    @hunters_improvement = hunters_improvement
    @improvement = hunters_improvement.improvement
    @hunter = hunters_improvement.hunter
    @improvable = hunters_improvement.improvable
  end

  def improve
    return false unless valid?
    true
  end

  def valid?
    check(:hunter_playbook_mismatch?, :hunter,
          "does not match improvement playbook: #{@improvement.playbook.name}")
    check(:hunter_not_advanced?, :hunter,
          'is not qualified for advanced improvements')
    @hunters_improvement.errors.none?
  end

  def hunter_not_advanced?
    @improvement.advanced && !Improvement.advanced_eligible?(@hunter)
  end

  def hunter_playbook_mismatch?
    @hunter.playbook != @improvement.playbook
  end

  def check(check, attribute, message)
    @hunters_improvement.errors.add(attribute, message) if send check
  end
end
