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

  describe '#archive!' do
    before do
      allow(Time).to receive(:now)
                 .and_return(Time.parse("2021-02-23 19:21:00"))
      playbook.archive! 
    end

    it 'sets the archived date' do
      expect(playbook.archived_at).not_to be_nil
    end

    context 'with created playbook' do
      let(:playbook) { create :playbook }

      it 'retains the archived_at' do
        expect(playbook.reload.archived_at).not_to be_nil
      end
    end

    context 'when playbook has already been archived' do
      let(:date) { Time.parse('2021-02-20 19:21:00') }
      let(:playbook) { build :playbook, archived_at: date }

      it "doesn't overwrite existing archived_at" do
        expect(playbook.archived_at).to eq date
      end
    end
  end

  describe '.unarchived' do
    subject { Playbook.unarchived }
    let(:date) { Time.parse('2021-02-20 19:21:00') }
    let!(:archived) { create :playbook, archived_at: date }
    let!(:unarchived) { create :playbook }

    it 'only unarchived values' do
      is_expected.to include unarchived
      is_expected.not_to include archived
    end
  end

  describe '.all' do
    subject { Playbook.all }
    let(:date) { Time.parse('2021-02-20 19:21:00') }
    let!(:archived) { create :playbook, archived_at: date }
    let!(:unarchived) { create :playbook }

    it 'only unarchived values' do
      is_expected.to include unarchived
      is_expected.not_to include archived
    end
  end

  # describe '#backstory' do
  #   subject { playbook.backstory }
  #   let(:playbook) { build :playbook, :with_backstory }

  #   it 'extracts and parses the backstory' do
  #     is_expected.to eq({"name" => "Fate", "headings" => [{'name'=> "How you found out.", 'count'=> 1, 'choices'=> ["Nightmares and visions", "Some weirdo told you."]  }]})
  #   end
  # end

  describe '#config' do
    subject { playbook.config }

    it { is_expected.to be_empty }

    context 'with backstory' do
      let(:playbook) { build :playbook, :with_backstory }

      # Sorry future maintainer. When I tried to configure Playbook without
      # an initializer in Rails 6.0.3.4, I couldn't associate Playbook::ConfigType
      # and I think it's because this code is missing in Rails 6.0.3.4:
      # https://github.com/rails/rails/blob/39e49edaf9694c938c67ea997d3cfa8c935921b2/activerecord/lib/active_record/attributes.rb#L208-L231
      # Try replacing #attribute(:config, :playbook_config) with attribute(:config, Playbook::ConfigType.new)
      # Good luck, and remember to thank exegete for this message!
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

      it 'maintains data on reload' do
        set_config
        playbook.save
        playbook.reload
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
