require 'rails_helper'

RSpec.describe HunterPolicy, type: :policy do
  let(:user) { create :user }
  let(:admin) { create :user, :admin }

  subject { described_class }

#  permissions ".scope" do
#    pending "add some examples to (or delete) #{__FILE__}"
#  end

  let(:hunter) { create :hunter }
  permissions :show? do
    it { expect(subject).to permit(user, hunter) }
  end

  permissions :create? do
    it { expect(subject).to permit(user, hunter) }
  end

  permissions :update? do
    it { expect(subject).not_to permit(user, hunter) }
    it { expect(subject).to permit(admin, hunter) }
    context "user belongs to hunter" do
      let(:hunter) { create :hunter, user: user }
      it { expect(subject).to permit(user, hunter) }
    end
  end

  permissions :destroy? do
    it { expect(subject).not_to permit(user, hunter) }
    it { expect(subject).to permit(admin, hunter) }
    context "user belongs to hunter" do
      let(:hunter) { create :hunter, user: user }
      it { expect(subject).to permit(user, hunter) }
    end
  end
end
