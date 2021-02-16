# frozen_string_literal: true

# A many-to-many association record for hunters to moves
# == Schema Information
#
# Table name: hunters_moves
#
#  id        :bigint           not null, primary key
#  advanced  :boolean
#  haven_id  :bigint
#  hunter_id :bigint
#  move_id   :bigint
#
# Indexes
#
#  index_hunters_moves_on_haven_id   (haven_id) WHERE (haven_id IS NOT NULL)
#  index_hunters_moves_on_hunter_id  (hunter_id)
#  index_hunters_moves_on_move_id    (move_id)
#
# Foreign Keys
#
#  fk_rails_...  (haven_id => havens.id)
#  fk_rails_...  (hunter_id => hunters.id)
#  fk_rails_...  (move_id => moves.id)
#
class HuntersMove < ApplicationRecord
  belongs_to :hunter
  belongs_to :move
  belongs_to :haven, optional: true

  # This is the Pundit Policy that governs HunterMove access
  #
  # @see HasHunterPolicy
  def self.policy_class
    HasHunterPolicy
  end
end
