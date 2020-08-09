# frozen_string_literal: true

json.extract! haven, :id, :name, :description, :created_at, :updated_at
json.url haven_url(haven, format: :json)
