# frozen_string_literal: true

json.extract! rating, :id, :playbook_id, :charm, :cool, :sharp, :tough, :weird, :created_at, :updated_at
json.url rating_url(rating, format: :json)
