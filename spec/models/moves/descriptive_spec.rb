# frozen_string_literal: true

# == Schema Information
#
# Table name: moves
#
# @!attribute id
#   @return []
# @!attribute description
#   @return [String]
# @!attribute haven
#   @return [Boolean]
# @!attribute name
#   @return [String]
# @!attribute rating
#   @return [Integer]
# @!attribute seven_to_nine
#   @return [String]
# @!attribute six_and_under
#   @return [String]
# @!attribute ten_plus
#   @return [String]
# @!attribute twelve_plus
#   @return [String]
# @!attribute type
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
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
