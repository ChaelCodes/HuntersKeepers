# == Schema Information
#
# Table name: gears
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  harm        :integer
#  armor       :integer
#  playbook_id :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Gear, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
