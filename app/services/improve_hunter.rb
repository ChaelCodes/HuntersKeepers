# frozen_string_literal: true

# This is the base class for improving a Hunter. All
# services that utilize this class belong in /services/improves
class ImproveHunter
  def self.for(improvement)
    return ImproveHunter unless improvement.type
    improvement.type.gsub('Improvements', 'Improves').constantize
  end

  # This will initialize @hunters_improvement,
  # @hunter, @improvement, and @improvable.
  # Any setup that all improve services need will be
  # handled here.
  # @param hunters_improvement
  def initialize(hunters_improvement)
    @hunters_improvement = hunters_improvement
    @improvement = hunters_improvement.improvement
    @hunter = hunters_improvement.hunter
    @improvable = hunters_improvement.improvable
  end

  # This method is overridden and used to
  # update and improve the hunter in subclasses
  # returns false if the hunter/improvement/improvable
  # combination is invalid
  # returns a truthy value otherwise
  def improve
    return false unless valid?
    true
  end

  # All improve services should extend this method
  # to apply their own constraints, and if they extend
  # the last check should be `@hunters_improvement.errors.none?`
  # This validations checks the hunter is authorized to use
  # the improvement, and that the hunter is of sufficient level
  # for advanced improvements.
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
