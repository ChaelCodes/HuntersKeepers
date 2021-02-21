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

  describe '#backstory' do
    subject { playbook.backstory }

    it { is_expected.to be_nil }

    context 'with backstory' do
      let(:playbook) { build :playbook, :with_backstory }

      # Sorry future maintainer. When I tried to configure Playbook without
      # an initializer in Rails 6.0.3.4, I couldn't associate Playbook::ConfigType
      # and I think it's because this code is missing in Rails 6.0.3.4:
      # https://github.com/rails/rails/blob/39e49edaf9694c938c67ea997d3cfa8c935921b2/activerecord/lib/active_record/attributes.rb#L208-L231
      # Try replacing #attribute(:config, :playbook_config) with attribute(:config, Playbook::ConfigType.new)
      # Good luck, and remember to thank exegete for this message!

      it 'encapsulates backstory in value object' do
        expect(subject).to be_kind_of(BackStories::Fate)
        expect(subject.name).to eq 'Fate'
        expect(subject.headings).to include(
        {name: "How you found out.",
                              count: 1,
                              choices: ["Nightmares and visions", "Some weirdo told you."]  }
        )
      end
    end
  end

  describe '#backstory=' do
    subject(:set_backstory) { playbook.backstory = config }

    context 'with string' do
      let(:config) { '{"name":"Fate"}' }

      it 'sets the playbook config' do
        set_backstory
        expect(playbook.backstory.name).to eq "Fate"
      end
    end

    context 'with hash' do
      let(:config) { {name: "Fate"} }

      it 'sets the playbook config' do
        set_backstory
        expect(playbook.backstory.name).to eq "Fate"
      end

      it 'maintains data on reload' do
        set_backstory
        playbook.save
        playbook.reload
        expect(playbook.backstory.name).to eq "Fate"
      end
    end

    context 'with ActiveSupport params' do
      let(:config) { {name: "Fate"}.with_indifferent_access }

      it 'sets the playbook config' do
        set_backstory
        expect(playbook.backstory.name).to eq "Fate"
      end
    end
  end
end
