# frozen_string_literal: true

FactoryBot.define do
  factory :hunters_improvement do
    transient do
      playbook { FactoryBot.create(:playbook) }
    end
    hunter { FactoryBot.create(:hunter, playbook: playbook) }
    improvement { FactoryBot.create(:improvement, playbook: playbook) }
  end
end
