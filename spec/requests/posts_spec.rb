require 'rails_helper'

RSpec.describe 'Post', type: :request do
  it 'check user post index action' do
    get '/users/1/posts'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('Number of posts')
  end

  it 'check user post show action' do
    get '/users/1/posts/1'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Comments')
  end
end
