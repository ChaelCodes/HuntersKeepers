# frozen_string_literal: true

# == Schema Information
#
# Table name: playbook_gears
#
#  id          :bigint           not null, primary key
#  playbook_id :bigint           not null
#  gear_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe PlaybookGear, type: :model do
  let(:gear) { create :gear }
  let(:playbook) { create :playbook }

  it 'correctly pulls gear from a playbook' do
    playbook.gears << gear
    expect(playbook.gear_ids).to include(gear.id)
  end

  it 'correctly pulls playbooks from gear' do
    playbook.gears << gear
    expect(gear.playbook_ids).to include(playbook.id)
  end
end
