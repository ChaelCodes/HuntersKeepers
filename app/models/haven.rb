# frozen_string_literal: true

# A Haven is safe space granted to Experts, Flakes, and several other classes
# Havens can be used by other party members, but the moves are only available
# through the Hunter
# == Schema Information
#
# Table name: havens
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
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
