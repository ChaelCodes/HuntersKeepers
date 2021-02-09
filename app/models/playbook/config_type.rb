module BackStories
  Fate = Struct.new(:backstory) do
    def name
      "Fate"
    end

    def headings
      self.backstory[:backstory][:headings]
    end

    def to_hash
      { name: self.name,
        headings: self.headings
      }
    end

    def empty?
      self.backstory.blank?
    end
  end
end

class Playbook::ConfigType < ActiveRecord::Type::Value
  # questions - questions we ask player
  # options - question options

  def cast(value)
    return nil if value.nil?
    return value if value.is_a?(BackStories::Fate)
    value = JSON.parse(value, symbolize_names: true) if value.is_a?(String)
    BackStories::Fate.new(value)
  end

  def serialize(value)
    return nil if value.nil? || value.empty?
    { backstory: value.to_hash }.to_json
  end

  def deserialize(value)
    cast(value)
  end
end
