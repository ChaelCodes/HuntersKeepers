# frozen_string_literal: true

# A many-to-many association record for Playbooks to Gear
# == Schema Information
#
# Table name: playbook_gears
#
#  id          :bigint           not null, primary key
#  playbook_id :bigint           not null
#  gear_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string
#
class PlaybookGear < ApplicationRecord
  belongs_to :playbook
  belongs_to :gear
end
