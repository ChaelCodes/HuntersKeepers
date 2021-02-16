require 'rails_helper'

describe 'gears#new' do
  
 
  it 'does not create new gears' do
    visit '/gears/new'
    expect(page).to_not have_content('New Gear')
  end
end