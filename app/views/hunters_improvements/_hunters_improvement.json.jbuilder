# frozen_string_literal: true

json.extract! hunters_improvement, :id, :created_at, :updated_at
json.url hunters_improvement_url(hunters_improvement, format: :json)
