# frozen_string_literal: true

# Actions that the hunters can take
# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  description   :string
#  haven         :boolean
#  name          :string
#  rating        :integer
#  seven_to_nine :string
#  six_and_under :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#
# Indexes
#
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
class Move < ApplicationRecord
  MOVE_TYPES = %w[Moves::Basic Moves::Rollable Moves::Descriptive].freeze

  belongs_to :playbook, optional: true
  has_many :hunters_moves, dependent: :destroy
  has_many :hunters, through: :hunters_moves

  scope :not_basic, -> { where.not(type: 'Moves::Basic') }
  # Filters to only moves the hunter h
  scope :with_hunter, (lambda do |hunter_id|
    includes(:hunters)
      .where(hunters: { id: hunter_id })
  end)
  # includes correct hunter_move if available
  scope :include_hunter_moves, (lambda do |hunter_id|
    includes(:hunters_moves)
      .where(hunters_moves: { hunter_id: [hunter_id, nil] })
  end)
  scope :haven, -> { where(haven: true) }

  validates :type, inclusion: { in: MOVE_TYPES }
  validates :name, presence: true
  validates :description, presence: true

  enum rating: { charm: 0, cool: 1, sharp: 2, tough: 3, weird: 4 }

  def rollable?
    false
  end
end
