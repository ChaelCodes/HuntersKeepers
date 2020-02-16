# frozen_string_literal: true

json.array! @moves do |move|
  json.partial! 'moves/moves', move: move
  json.has_move move.hunters_move.exists? if params[:hunter_id]
end
