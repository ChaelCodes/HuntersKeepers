# frozen_string_literal: true

# == Schema Information
#
# Table name: hunters_moves
#
#  id        :bigint           not null, primary key
#  hunter_id :bigint
#  move_id   :bigint
#  haven_id  :bigint
#  advanced  :boolean
#
# A many-to-many association record for hunters to moves
class HuntersMove < ApplicationRecord
  belongs_to :hunter
  belongs_to :move
  belongs_to :haven, optional: true
end
