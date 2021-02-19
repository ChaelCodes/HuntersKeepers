# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HunterPolicy, type: :policy do
  subject { described_class }

  let(:user) { build :user }
  let(:admin) { build :user, :admin }
  let(:logged_out_user) { nil }
  let(:banned_user) { build :user, :banned }

  permissions '.scope' do
  end

  let(:hunter) { build :hunter }

  permissions :show? do
    it { expect(subject).to permit(user, hunter) }
  end

  permissions :create? do
    it { expect(subject).to permit(user, hunter) }
    it { expect(subject).to permit(admin, hunter) }
    it { expect(subject).not_to permit(nil, hunter) }
    it { expect(subject).not_to permit(banned_user, hunter) }
  end

  permissions :update? do
    it { expect(subject).not_to permit(user, hunter) }
    it { expect(subject).to permit(admin, hunter) }
    it { expect(subject).not_to permit(nil, hunter) }

    context 'when user belongs to hunter' do
      let(:hunter) { build :hunter, user: user }

      it { expect(subject).to permit(user, hunter) }
    end
  end

  permissions :destroy? do
    it { expect(subject).not_to permit(user, hunter) }
    it { expect(subject).to permit(admin, hunter) }
    it { expect(subject).not_to permit(nil, hunter) }

    context 'user belongs to hunter' do
      let(:hunter) { create :hunter, user: user }

      it { expect(subject).to permit(user, hunter) }
    end
  end
end
