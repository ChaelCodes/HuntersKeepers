# frozen_string_literal: true

# == Schema Information
#
# Table name: playbook_gears
#
#  id          :bigint           not null, primary key
#  playbook_id :bigint           not null
#  gear_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :playbook_gear do
  end
end
