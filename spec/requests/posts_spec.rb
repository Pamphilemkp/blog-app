require 'rails_helper'

RSpec.describe 'Post', type: :request do
  it 'check user post index action' do
    get '/users/:user_id/posts'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('Welcome, here are different posts')
  end

  it 'check user post show action' do
    get '/user/:user_id/post/id'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Here is the post place')
  end
end
