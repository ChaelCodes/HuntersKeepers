# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe 'db:seed:development:hunter' do
  subject { Rake::Task['db:seed:development:hunter'] }

  before { Rails.application.load_tasks }

  it 'create 5 hunters' do
    hunter_count = Hunter.count + 5
    expect { subject.execute }.not_to raise_error
    subject.reenable
    expect(Hunter.count).to eq hunter_count
  end
end
