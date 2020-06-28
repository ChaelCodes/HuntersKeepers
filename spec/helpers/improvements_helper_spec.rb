# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ImprovementsHelper.
RSpec.describe ImprovementsHelper, type: :helper do
  describe '#link_to_improvement' do
    subject { helper.link_to_improvement(improvement) }

    let(:improvement) { create :improvement, description: 'description' }

    it 'links to the improvement' do
      expected = %(<a href="/improvements/#{improvement.id}">description</a>)
      expect(subject).to eq expected
    end

    context 'with Subclass of Improvement' do
      let(:improvement) { create :rating_boost, description: 'description' }

      it 'links to the improvement' do
        expected = %(<a href="/improvements/#{improvement.id}">description</a>)
        expect(subject).to eq expected
      end
    end
  end
end
