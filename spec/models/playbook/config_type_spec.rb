require 'rails_helper'

RSpec.describe Playbook::ConfigType, type: :model do
  xdescribe '#serialize' do
    subject { playbook_config_type.serialize(playbook_config_type) }

    it { is_expected.to eq '{}' }
  end

  xcontext 'ensuring column storage' do
    it 'stores config on an already saved playbook' do
      playbook = create(:playbook)
      playbook.backstory = { backstory: {
                  name: "Fate",
                  headings: [{name: "How you found out.",
                              count: 1,
                              choices: ["Nightmares and visions", "Some weirdo told you."] }]}
      }
      playbook.save
      playbook.reload
      expect(playbook.backstory.name).to eq "Fate"
      expect(playbook.backstory.headings.first[:name]).to eq "How you found out."
    end
  end
end
