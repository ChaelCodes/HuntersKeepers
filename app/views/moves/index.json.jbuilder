# frozen_string_literal: true

json.array! @moves, partial: 'moves/move', as: :move
