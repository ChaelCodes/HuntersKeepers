# frozen_string_literal: true

json.extract! playbook, :id, :name, :description, :luck_effect,
              :created_at, :updated_at
json.url playbook_url(playbook, format: :json)
