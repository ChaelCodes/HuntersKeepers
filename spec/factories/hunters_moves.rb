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
FactoryBot.define do
  factory :hunters_move do
    hunter
    move
  end
end
