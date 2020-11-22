# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
#  id            :bigint           not null, primary key
#  description   :string
#  haven         :boolean
#  name          :string
#  rating        :integer
#  seven_to_nine :string
#  six_and_under :string
#  ten_plus      :string
#  twelve_plus   :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  playbook_id   :bigint
#
# Indexes
#
#  index_moves_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
require 'rails_helper'

RSpec.describe Moves::Descriptive, type: :model do
  let(:descriptive) { create(:moves_descriptive) }

  describe '#rollable?' do
    subject { descriptive.rollable? }

    it { is_expected.to be_falsey }
  end

  describe '#roll_results' do
    subject { descriptive.roll_results(hunter) }
    let(:hunter) { create(:hunter) }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end
end
