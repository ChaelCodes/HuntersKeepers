# frozen_string_literal: true

# == Schema Information
#
# Table name: hunters_moves
#
#  id        :bigint           not null, primary key
#  hunter_id :bigint
#  move_id   :bigint
#  advanced  :boolean
#
class HuntersMove < ApplicationRecord
  belongs_to :hunter
  belongs_to :move
end
