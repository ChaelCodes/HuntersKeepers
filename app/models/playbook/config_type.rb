# frozen_string_literal: true

module BackStories
  Fate = Struct.new(:backstory) do
    def name
      backstory[:name]
    end

    def headings
      backstory[:headings] || []
    end

    def to_hash
      {
        name: name,
        headings: headings
      }
    end

    def empty?
      backstory.blank?
    end
  end
end

# This ConfigType holds Backstory information for the Playbook
# It automatically converts its data into a BAckstory object
module Playbook
  class ConfigType < ActiveRecord::Type::Value
    def cast(value)
      return nil if value.nil?
      return value if value.is_a?(BackStories::Fate)
      value = JSON.parse(value, symbolize_names: true) if value.is_a?(String)

      BackStories::Fate.new(value)
    end

    def serialize(value)
      return nil if value.blank?
      value.to_hash.to_json
    end

    def deserialize(value)
      cast(value)
    end
  end
end
