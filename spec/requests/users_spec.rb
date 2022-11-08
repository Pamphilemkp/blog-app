require 'rails_helper'

RSpec.describe 'User', type: :request do
  it 'check user index action' do
    get '/users/'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('Hello, welcome to the blog')
  end

  it 'check user show action' do
    get '/users/id'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Here is where you can see more details about the user')
  end
end
