require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'user show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Elon Musk', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'this is my bio')

    Post.create(title: 'fist post', text: 'tests', author_id: @user.id)
    Post.create(title: 'second post', text: 'tests', author_id: @user.id)
    Post.create(title: 'third post', text: 'tests', author_id: @user.id)
    Post.create(title: 'fourth post', text: 'tests', author_id: @user.id)
    
     visit user_path(@user.id)
  end

  it 'shows the right name of the first user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the right photo of the first user' do
    expect(page.html).to include(@user.photo)
  end

  it 'shows the bio of the first user' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows the 3 most recent posts of the user' do
    expect(page).to have_content('fourth post')
    expect(page).to have_content('third post')
    expect(page).to have_content('second post')

  end

  it 'shows the button to see all the posts' do
    expect(page).to have_content('See all posts')
  end

  it 'when click on all posts, should redirect to the user post index' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user.id))
  end

end
