require 'rails_helper'

RSpec.describe Playbook::ConfigType, type: :model do
  let(:playbook_config_type) { build(:playbook_config_type) }

  it 'has a valid factory' do
    expect(playbook_config_type).to be_kind_of(Playbook::ConfigType)
  end

  describe '#serialize' do
    subject { playbook_config_type.serialize(playbook_config_type) }

    it { is_expected.to eq '' }
  end

  context 'ensuring column storage' do
    let(:playbook) { create(:playbook) }

    it 'stores data in the playbook' do
      playbook.config = { backstory: { name: 'The Name' } }
      playbook.save
      playbook.reload
      expect(playbook.backstory[:name]).to eq 'The Name'
    end
  end
end
