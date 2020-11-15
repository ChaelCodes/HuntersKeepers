# frozen_string_literal: true

# == Schema Information
#
# Table name: playbooks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :playbook do
    name { 'The Nameless' }
    description { 'A nameless playbook for a namelees entity.' }
  end
end
