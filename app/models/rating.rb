# frozen_string_literal: true

# The ratings/attributes that the Hunter has
# determines their capability to do something
class Rating < ApplicationRecord
  belongs_to :playbook

  LIST = %i[charm cool sharp tough weird]
end
