
# frozen_string_literal: true

json.array! @hunter_backstories,
            partial: 'hunter_backstories/hunter_backstory',
            as: :hunter_backstory
