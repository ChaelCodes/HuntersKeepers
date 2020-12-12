# frozen_string_literal: true

# Gear is equipment that the Hunter can use.
# It is provided by the Playbook.
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
class Gear < ApplicationRecord
  belongs_to :playbook
  validates :name, presence: true
  acts_as_taggable
end
