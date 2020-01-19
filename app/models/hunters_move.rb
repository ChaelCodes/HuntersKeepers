# frozen_string_literal: true

# A many-to-many association record for hunters to moves
class HuntersMove < ApplicationRecord
  belongs_to :hunter
  belongs_to :move
end
