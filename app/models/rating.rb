# frozen_string_literal: true

# The ratings/attributes that the Hunter has
# determines their capability to do something
# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  charm       :integer
#  cool        :integer
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
#
# Indexes
#
#  index_ratings_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
class Rating < ApplicationRecord
  LIST = %i[charm cool sharp tough weird].freeze

  belongs_to :playbook, dependent: :destroy
  validates(*LIST, presence: true, numericality: true)
end
