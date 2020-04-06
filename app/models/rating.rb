# frozen_string_literal: true

# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  playbook_id :bigint
#  charm       :integer
#  cool        :integer
#  sharp       :integer
#  tough       :integer
#  weird       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# The ratings/attributes that the Hunter has
# determines their capability to do something
class Rating < ApplicationRecord
  belongs_to :playbook

  LIST = %i[charm cool sharp tough weird].freeze
end
