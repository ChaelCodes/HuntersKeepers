# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovesHelper, type: :helper do
  describe '#move_source' do
    subject { helper.move_source(move) }

    context 'when BasicMove' do
      let(:move) { build :moves_basic }

      it { is_expected.to eq 'Basic' }
    end

    context 'when Move comes from playbook' do
      let(:move) { build :move }

      it { is_expected.to eq helper.link_to_playbook(move) }
    end

    context 'when Move comes from Haven' do
      let(:move) { build :move, haven: true }

      it { is_expected.to eq 'Haven' }
    end
  end
end
