# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe 'db:seed' do
  subject { Rake::Task['db:seed'] }

  before { Rails.application.load_tasks }

  it 'create 5 hunters' do
    expect { subject.invoke }.not_to raise_error
  end
end
