# frozen_string_literal: true

# Represent the user and interface with Devise to log into the application.
# == Schema Information
#
# Table name: users
#
# @!attribute id
#   @return []
# @!attribute admin
#   @return [Boolean]
# @!attribute banned_at
#   @return [Time]
# @!attribute confirmation_sent_at
#   @return [Time]
# @!attribute confirmation_token
#   @return [String]
# @!attribute confirmed_at
#   @return [Time]
# @!attribute email
#   @return [String]
# @!attribute encrypted_password
#   @return [String]
# @!attribute remember_created_at
#   @return [Time]
# @!attribute reset_password_sent_at
#   @return [Time]
# @!attribute reset_password_token
#   @return [String]
# @!attribute unconfirmed_email
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable,
         :recoverable, :registerable,
         :rememberable, :validatable
  validates :email, uniqueness: true

  def ban!
    raise 'User has already been Banned' if banned?
    update!(banned_at: Time.zone.now)
  end

  def banned?
    banned_at.present?
  end

  def active_for_authentication?
    super && !banned?
  end
end
