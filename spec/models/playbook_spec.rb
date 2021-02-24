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
end
