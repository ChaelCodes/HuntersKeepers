# frozen_string_literal: true

json.array!(@moves) do |move|
  json.partial! 'moves/move', move: move
  json.has_move move.hunters_moves.exists? if params[:hunter_id]
end
