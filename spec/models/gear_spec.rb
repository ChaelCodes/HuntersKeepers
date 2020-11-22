# == Schema Information
#
# Table name: gears
#
#  id          :bigint           not null, primary key
#  armor       :integer
#  description :string
#  harm        :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
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
