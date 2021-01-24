# frozen_string_literal: true

json.partial! 'moves/move', move: @move
json.results @results
json.roll @roll
json.luck_effect @luck_effect
