require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'user posts index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Elon Musk', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'this is my bio')
    @post1 = Post.create(title: 'The first cool stuff', text: 'tests', author_id: @user.id)
    Post.create(title: 'fist post', text: 'tests', author_id: @user.id)
    Post.create(title: 'second post', text: 'tests', author_id: @user.id)
    Post.create(title: 'third post', text: 'tests', author_id: @user.id)
    
    Comment.create(text: 'This is just for testing purpose', author_id: @user.id, post_id: @post1.id)
    

    visit user_posts_path(@user.id)
  end

  it 'shows the profile of the user' do
    expect(page.html).to include(@user.photo)
  end

  it 'shows the user name' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the right posts of the first user' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'shows the post title' do
    expect(page).to have_content('fist post')
  end

  
  it 'shows the post body' do
    expect(page).to have_content('test')
  end

  it 'shows the first comment of the post' do
    expect(page).to have_content('This is just for testing purpose')
  end

  it 'shows how many comments a post has' do
    expect(page).to have_content(1)
  end

  it 'shows the number of likes' do
    expect(page).to have_content(0)
  end

  it 'shows a section for pagination if there are more posts than fit on the view.' do
    expect(page).to have_content('Pagination')
  end
end
