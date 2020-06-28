# frozen_string_literal: true

# Helper for displaying Gears
module GearsHelper
  def gear_display_tags(gear)
    gear_tags = []
    gear_tags << "#{gear.harm}-harm" if gear.harm.to_i.positive?
    gear_tags << "#{gear.armor}-armor" if gear.armor.to_i.positive?
    gear_tags += gear.tag_list
    return '' if gear_tags.empty?
    "(#{gear_tags.join(' ')})"
  end

  def link_to_gear(gear)
    gear ? link_to(gear.name, gear) : ''
  end
end
