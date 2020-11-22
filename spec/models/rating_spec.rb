# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  charm       :integer
#  cool        :integer
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playbook_id :bigint
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
