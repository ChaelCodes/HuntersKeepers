class Playbook::ConfigType < ActiveRecord::Type::Value
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
    value.to_json
  end
  # Playbook.connection.execute("SELECT * FROM playbooks;").first
  # ::ActiveSupport::JSON.encode(value.to_hash)
  # value
  # value.to_hash
  # value.to_hash.to_json

  def deserialize(value)
    cast(value)
  end

  def to_hash()
    {
      backstory: backstory
    }
  end

  def changed?(old_value, new_value, _new_value_before_type_cast)
    old_value.to_hash != new_value.to_hash
  end

  def empty?
    true if backstory.nil?
  end
end
