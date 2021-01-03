# frozen_string_literal: true

json.extract! hunter_backstory, :id, :hunter, :playbook, :choices,
                                :created_at, :updated_at
json.url url_for(hunter_backstory, format: :json)
