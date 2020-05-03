# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe 'db:seed:development:hunter' do
  subject { Rake::Task['db:seed:development:hunter'] }

  before { Rails.application.load_tasks }

  after do
    subject.reenable
    Rake::Task['db:seed:development:user'].reenable
    Rake::Task['db:seed:playbook'].reenable
  end

  it 'create 5 hunters' do
    hunter_count = Hunter.count + 5
    expect { subject.invoke }.not_to raise_error
    expect(Hunter.count).to eq hunter_count
  end
end