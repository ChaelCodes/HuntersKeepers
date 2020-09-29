# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  name          :string
#  rating        :integer
#  six_and_under :string
#  seven_to_nine :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#  description   :string
#
# Actions that the hunters can take
class Move < ApplicationRecord
  MOVE_TYPES = %w[Moves::Basic Moves::Rollable Moves::Descriptive].freeze

  belongs_to :playbook, optional: true
  has_many :hunters_moves, dependent: :destroy

  scope :not_basic, -> { where.not(type: 'Moves::Basic') }
  scope :with_hunter_moves, (lambda do |hunter_id|
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
