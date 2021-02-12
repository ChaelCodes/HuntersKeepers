# frozen_string_literal: true

# A Haven is safe space granted to Experts, Flakes, and several other classes
# Havens can be used by other party members, but the moves are only available
# through the Hunter
# == Schema Information
#
# Table name: havens
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute name
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute user_id
#   @return []
#
# Indexes
#
#  index_havens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Haven < ApplicationRecord
  has_many :hunters_moves, dependent: :nullify
  belongs_to :user

  validates :name, presence: true

  def to_s
    name
  end
end
