# frozen_string_literal: true

# == Schema Information
#
# Table name: playbooks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Playbook, type: :model do
  context 'when parameters are valid' do
    let(:playbook) { create :playbook }

    it 'creates a new Playbook' do
      expect(playbook).to be_valid
    end
  end

  context 'when parameters are invalid' do
    let(:playbook) { build :playbook, name: '' }

    it 'does not create a new record' do
      expect(playbook).not_to be_valid
    end
  end
end
