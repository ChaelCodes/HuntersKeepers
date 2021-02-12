# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  describe '#banned?' do
    subject { user.banned? }

    it { is_expected.to be_falsey }

    context 'banned user' do
      let(:user) { create :user, :banned }

      it { is_expected.to be_truthy }
    end
  end

  describe '#ban!' do
    subject { user.ban! }

    it { expect { subject }.to change(user, :banned?).from(false).to(true) }

    context 'banned user' do
      let(:user) { create(:user, :banned) }

      it 'warns the admin of a banned user' do
        expect { subject }.to raise_error('User has already been Banned')
      end
    end
  end

  describe '#active_for_authentication?' do
    subject { user.active_for_authentication? }

    it { is_expected.to be_truthy }

    context 'banned user' do
      let(:user) { create :user, :banned }

      it { is_expected.to be_falsey }
    end
  end
end
