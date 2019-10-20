class Moves::Descriptive < Move
  def roll_results(hunter)
    raise NotImplementedError
  end

  def rollable?
    false
  end
end
