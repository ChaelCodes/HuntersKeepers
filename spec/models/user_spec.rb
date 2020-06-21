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
