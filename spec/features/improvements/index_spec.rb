require 'rails_helper'

describe 'improvements#index' do
  it 'does not show New Improvement link' do
    visit "/improvements"
    expect(page).to_not have_content 'New Improvement'
  end  


  context 'when signed in' do
    let(:user) { create :user, :admin }

    before do
      sign_in user
    end

    it 'does show New Improvement link' do
      visit "/improvements"
      expect(page).to have_content 'New Improvement'
    end 

    # it 'has a list of improvements' do
    #   visit "/improvements"

    #   expect(page).to_not have_content 'New Improvement'
    #   # page.all('thead > tr').each do |page|
        
    #   # end
    #   end
    # end
  end
end