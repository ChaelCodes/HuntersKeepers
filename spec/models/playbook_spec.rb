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

  # describe '#backstory' do
  #   subject { playbook.backstory }
  #   let(:playbook) { build :playbook, :with_backstory }

  #   it 'extracts and parses the backstory' do
  #     is_expected.to eq({"name" => "Fate", "headings" => [{'name'=> "How you found out.", 'count'=> 1, 'choices'=> ["Nightmares and visions", "Some weirdo told you."]  }]})
  #   end
  # end
end
