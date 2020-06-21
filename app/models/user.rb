# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean
#
# Represent the user and interface with Devise to log into the application.
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
