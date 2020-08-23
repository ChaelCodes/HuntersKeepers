# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationPolicy, type: :policy do
  subject { described_class }

  let(:user) { build :user }
  let(:admin) { build :user, :admin }
  let(:logged_out_user) { nil }
  let(:banned_user) { build :user, :banned }

  permissions '.scope' do
  end

  let(:record) { build :playbook }

  permissions :show? do
    it { expect(subject).to permit(user, record) }
    it { expect(subject).to permit(logged_out_user, record) }
  end

  permissions :create? do
    it { expect(subject).to permit(admin, record) }
    it { expect(subject).not_to permit(user, record) }
    it { expect(subject).not_to permit(logged_out_user, record) }
    it { expect(subject).not_to permit(banned_user, record) }
  end

  permissions :update? do
    it { expect(subject).not_to permit(user, record) }
    it { expect(subject).to permit(admin, record) }
    it { expect(subject).not_to permit(logged_out_user, record) }
  end

  permissions :destroy? do
    it { expect(subject).not_to permit(user, record) }
    it { expect(subject).to permit(admin, record) }
    it { expect(subject).not_to permit(logged_out_user, record) }
  end
end
