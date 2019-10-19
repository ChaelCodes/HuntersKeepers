# frozen_string_literal: true

json.extract! hunter, :id,
              :name,
              :harm,
              :luck,
              :experience,
              :charm,
              :cool,
              :sharp,
              :tough,
              :weird,
              :created_at,
              :updated_at
json.url hunter_url(hunter, format: :json)
