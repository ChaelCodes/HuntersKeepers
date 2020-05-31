# frozen_string_literal: true

# Moves Helper
module MovesHelper
  def link_to_move(move)
    link_to move.name, move_path(move)
  end
end
