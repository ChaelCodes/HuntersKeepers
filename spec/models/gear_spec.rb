# == Schema Information
#
# Table name: gears
#
# @!attribute id
#   @return []
# @!attribute armor
#   @return [Integer]
# @!attribute description
#   @return [String]
# @!attribute harm
#   @return [Integer]
# @!attribute name
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_gears_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
require 'rails_helper'

RSpec.describe Gear, type: :model do
  describe 'factory is valid' do
    let(:gear) { build :gear }

    it { expect(gear).to be_valid }
  end
end
