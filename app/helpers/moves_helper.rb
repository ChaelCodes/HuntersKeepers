# frozen_string_literal: true

# Moves Helper
module MovesHelper
  def link_to_move(move)
    link_to move.name, move_path(move)
  end

  def move_source(move)
    case
    when move.haven?
      'Haven'
    when move.is_a?(Moves::Basic)
      'Basic'
    when move.playbook
      link_to_playbook(move)
    end
  end
end
