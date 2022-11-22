require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Elon Musk', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'this is my bio')

    visit users_path
  end

  it 'shows the right name of the first user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the right photo of the first user' do
    expect(page.html).to include(@user.photo)
  end

  it 'shows the right posts of the first user' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'redirects to a give user show page' do
    click_link "See more about #{@user.name}"
    expect(page).to have_current_path(user_path(@user.id))
  end
end
