# frozen_string_literal: true

FactoryBot.define do
  factory :same_playbook, class: 'Playbook' do
  end
  playbook = FactoryBot.create(:same_playbook)

  factory :hunters_improvement do
    association :hunter, playbook: playbook
    association :improvement, playbook: playbook
  end
end
