require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GearsHelper. For example:
#
# describe GearsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GearsHelper, type: :helper do
  describe '#gear_display_tags' do
    subject { helper.gear_display_tags(gear) }

    let(:gear) { create(:gear, :with_tags) }

    it { is_expected.to eq '(2-harm 1-armor heavy slow)' }
  end
end
