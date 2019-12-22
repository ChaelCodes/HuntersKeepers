# frozen_string_literal: true

json.extract! move, :id,
              :name,
              :description,
              :rating,
              :six_and_under,
              :seven_to_nine,
              :ten_plus,
              :twelve_plus,
              :created_at,
              :updated_at
json.url move_url(move, format: :json)
