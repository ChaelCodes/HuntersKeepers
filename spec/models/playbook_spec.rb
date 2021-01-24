# == Schema Information
#
# Table name: playbooks
#
# @!attribute id
#   @return []
# @!attribute backstory
#   @return [Hash]
# @!attribute description
#   @return [String]
# @!attribute luck_effect
#   @return [String]
# @!attribute name
#   @return [String]
# @!attribute created_at
#   @return [Time]
# @!attribute updated_at
#   @return [Time]
#
require 'rails_helper'

RSpec.describe Playbook, type: :model do
  let(:playbook) { build(:playbook) }

  it 'has a valid factory' do
    expect(playbook).to be_valid
  end

  describe '#config' do
    subject { playbook.config }

    it { is_expected.to be_empty  }

    context 'with backstory' do
      let(:playbook) { build :playbook, :with_backstory }

      it 'encapsulates backstory in value object' do
        expect(subject).to be_kind_of(Playbook::ConfigType)
        expect(subject.backstory[:name]).to eq 'Fate'
        expect(subject.headings).to include(
        {name: "How you found out.", 
                              count: 1,
                              choices: ["Nightmares and visions", "Some weirdo told you."]  }
        ) 
      end
    end
  end

  describe '#config=' do
    subject(:set_config) { playbook.config = config }

    context 'with string' do
      let(:config) { '{"backstory": {"name":"Fate"}}' }

      it 'sets the playbook config' do
        set_config
        expect(playbook.backstory[:name]).to eq "Fate"
      end
    end

    context 'with hash' do
      let(:config) { {backstory: {name: "Fate"}} }

      it 'sets the playbook config' do
        set_config
        expect(playbook.backstory[:name]).to eq "Fate"
      end
    end

    context 'with ActiveSupport params' do
      let(:config) { {backstory: {name: "Fate"}}.with_indifferent_access }

      it 'sets the playbook config' do
        set_config
        expect(playbook.backstory[:name]).to eq "Fate"
      end
    end
  end
end
