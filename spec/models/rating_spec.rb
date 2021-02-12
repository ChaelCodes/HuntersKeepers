# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
# @!attribute id
#   @return []
# @!attribute charm
#   @return [Integer]
# @!attribute cool
#   @return [Integer]
# @!attribute sharp
#   @return [Integer]
# @!attribute tough
#   @return [Integer]
# @!attribute weird
#   @return [Integer]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
# @!attribute playbook_id
#   @return []
#
# Indexes
#
#  index_ratings_on_playbook_id  (playbook_id)
#
# Foreign Keys
#
#  fk_rails_...  (playbook_id => playbooks.id)
#
require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { build(:rating) }

  describe 'validate factory' do
    it { expect(rating).to be_valid }
  end
end
