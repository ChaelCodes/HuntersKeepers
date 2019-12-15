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
              :playbook_id,
              :created_at,
              :updated_at
json.url hunter_url(hunter, format: :json)

if @available_improvements
  json.available_improvements hunter.available_improvements, partial: 'improvements/improvement', as: :improvement
end
