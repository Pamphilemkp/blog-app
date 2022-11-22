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
    

    visit user_post_path(@user.id, @post1)
  end

  it 'shows the post title' do
    expect(page.html).to have_content(@post1.title)
  end

  it 'shows the user who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of likes' do
    expect(page).to have_content(0)
  end

  it 'shows the post body' do
    expect(page).to have_content(@post1.text)
  end

  it 'renders the username of each commentor' do
    expect(page).to have_content(@user.name)
  end

  it 'renders the comment each commentor left' do
    expect(page).to have_content('This is just for testing purpose')
  end
end