require 'rails_helper'

RSpec.describe Playbook::ConfigType, type: :model do
  let(:playbook_config_type) { build(:playbook_config_type) }

  it 'has a valid factory' do
    expect(playbook_config_type).to be_kind_of(Playbook::ConfigType)
  end

  describe '#serialize' do
    subject { playbook_config_type.serialize(playbook_config_type) }

    it { is_expected.to eq '{"backstory":{}}' }
  end

  context 'ensuring column storage' do
    it 'stores config on an already saved playbook' do
      playbook = create(:playbook)
      playbook.config = { backstory: {
                  name: "Fate",
                  headings: [{name: "How you found out.",
                              count: 1,
                              choices: ["Nightmares and visions", "Some weirdo told you."] }]}
    }
      playbook.save
      playbook.reload
      expect(playbook.config.name).to eq "Fate"
      expect(playbook.config.headings.first[:name]).to eq "How you found out."
    end
  end
end
