# frozen_string_literal: true

json.extract! improvement,
  :id, :description, :type, :rating, :stat_limit, :advanced,
  :created_at, :updated_at
json.url improvement_url(improvement, format: :json)
