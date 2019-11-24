# frozen_string_literal: true

json.extract! improvement, :id, :description, :type, :move_id, :rating, :stat_limit, :created_at, :updated_at
json.url improvement_url(improvement, format: :json)
