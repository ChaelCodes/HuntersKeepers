require 'rails_helper'

describe 'improvements#new' do
  
 
  it 'does not create new improvement' do
    visit '/improvements/new'
    expect(page).to_not have_content('New Improvement')
  end
end

# This page should not show when a user is not logged in
# docker exec hunterskeepers_web bundle exec rspec spec/features/improvements/index_spec.rb