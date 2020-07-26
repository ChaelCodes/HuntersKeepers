# frozen_string_literal: true

namespace :data do
  desc 'Update the type for all retired improvements'
  task upgrade_retired_improvement: :environment do
    Improvement
      .where(description: 'Retire this Hunter to safety.')
      .update_all(description: 'Retire this hunter to safety.', # rubocop:disable Rails/SkipsModelValidations
                  type: 'Improvements::Retire')
  end
end
