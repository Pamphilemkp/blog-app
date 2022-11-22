require 'rails_helper'
require "capybara/rspec"

RSpec.describe 'user index page', type: :system do

 before(:each) do 
  
  @first_user = User.first
  

  end

  it 'shows the right name of the first user' do
    visit users_path
      expect(page).to have_content('Tom')
  end
end