# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Moves::Descriptive, type: :model do
  let(:descriptive) { create(:moves_descriptive) }

  describe '#rollable?' do
    subject { descriptive.rollable? }

    it { is_expected.to be_falsey }
  end

  describe '#roll_results' do
    subject { descriptive.roll_results(hunter) }
    let(:hunter) { create(:hunter) }

    it { expect { subject }.to raise_error(NotImplementedError) }
  end
end
