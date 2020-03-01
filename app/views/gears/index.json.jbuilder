# frozen_string_literal: true

json.array! @gears do |gear|
  json.partial! 'gears/gear', gear: gear
  json.has_gear @hunter.gear_ids.include? gear.id if @hunter
end
