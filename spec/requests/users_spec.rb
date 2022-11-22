require 'rails_helper'

RSpec.describe 'User', type: :request do
  it 'check user index action' do
    get users_path

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('Number of post')
  end

  it 'check user show action' do
    get user_path(1)

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Bio')
  end
end
