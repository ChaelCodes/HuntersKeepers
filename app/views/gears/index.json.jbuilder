# frozen_string_literal: true

json.array! @gears, partial: 'gears/gear', as: :gear
