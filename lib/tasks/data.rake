# frozen_string_literal: true

namespace :data do
  desc 'Update the type for all retired improvements'
  task upgrade_retired_improvement: :environment do
    Improvement
      .where(description: 'Retire this Hunter to safety.')
      .update_all(description: 'Retire this hunter to safety.', # rubocop:disable Rails/SkipsModelValidations
                  type: 'Improvements::Retire')
  end

  # We're renaming config to backstory
  desc 'Copy everything in Config to Backstory'
  task copy_from_config_to_backstory: :environment do
    Playbook.in_batches do |playbooks|
      playbooks.update_all('backstory = config')
    end
  end

  desc 'Delete unauthorized record creation'
  task delete_unauth_improvements: :environment do
    Improvement.where("created_at >  to_timestamp('15 Feb 2021', 'DD Mon YYYY')")
               .where("created_at < to_timestamp('18 Feb 2021', 'DD Mon YYYY')")
               .delete_all
  end
end
