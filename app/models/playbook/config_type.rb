class Playbook::ConfigType < ActiveModel::Type::Value
  attr_accessor :backstory, :headings
  # questions - questions we ask player
  # options - question options

  def cast(value)
    return Playbook::ConfigType.new if value.nil?
    return value if value.is_a?(Playbook::ConfigType)
    value = JSON.parse(value, symbolize_names: true) if value.is_a?(String)
    self.backstory = value[:backstory]
    self.headings = backstory[:headings]
    self
  end
  
  def serialize(value)
    return nil if value.nil? || value.empty?
    value.to_hash.to_json
  end

  def deserialize(value)
    return nil if value.nil?
    cast(value)
  end

  def to_hash()
    {
      backstory: backstory
    }
  end

  def empty?
    true if backstory.nil?
  end
end
