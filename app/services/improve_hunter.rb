class ImproveHunter
  def self.for(improvement)
    case improvement.type
    when 'Improvement::HavenMove'
      Improves::HavenMove
    when 'Improvements::RatingBoost'
      Improves::RatingBoost
    else
      ImproveHunter
    end
  end

  def initialize(hunters_improvement)
    @hunters_improvement = hunters_improvement
    @improvement = hunters_improvement.improvement
    @hunter = hunters_improvement.hunter
  end

  def improve
    return false unless valid?
    true
  end

  def valid?
    check(:hunter_playbook_matches?, :hunter, "does not match improvement playbook: #{@improvement.playbook.name}")
    check(:advanced_acceptable, :hunter, 'is not qualified for advanced improvements')
    @hunters_improvement.errors.none?
  end

  def advanced_acceptable
    !@improvement.advanced || Improvement.advanced_eligible?(@hunter)
  end

  def hunter_playbook_matches?
    @hunter.playbook == @improvement.playbook
  end

  def check(check, attribute, message)
    unless send check
      @hunters_improvement.errors.add(attribute, message)
    end
  end
end
