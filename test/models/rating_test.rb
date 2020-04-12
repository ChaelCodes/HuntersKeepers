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
require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
