# frozen_string_literal: true

json.extract! gear, :id, :name, :description, :harm, :armor, :playbook_id,
              :tag_list, :created_at, :updated_at
json.url gear_url(gear, format: :json)
