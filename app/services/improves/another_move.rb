# frozen_string_literal: true

module Improves
  # Used to apply an Improvements::HavenMove to a hunter
  # if the hunter is a valid target
  class AnotherMove < ImproveHunter
    include Improves::Moveable

    def initialize(hunters_improvement)
      super
      move
    end

    def improve
      return false unless valid?
      @hunter.moves << move
    end

    def valid?
      super
      check :playbook_move_match?, :move,
            'matches improvement playbook'
      check :hunter_move_exists?, :hunter,
            "already has move with id #{@move&.id}"
      @hunters_improvement.errors.none?
    end
  end
end
