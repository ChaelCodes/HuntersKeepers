# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GearPolicy, type: :policy do
  subject { described_class }

  let(:user) { build :user }
  let(:admin) { build :user, :admin }
  let(:logged_out_user) { nil }

  let(:gear) { build :gear}

  permissions :edit?, :delete? do
    it { expect(subject).to permit(admin, gear) }
    it { expect(subject).not_to permit(user, gear) }
    it { expect(subject).not_to permit(logged_out_user, gear) }
  end
end
