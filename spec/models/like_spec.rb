require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should ivalid wihtout an author' do
    like = Like.new(author: nil)
    expect(like).to_not be_valid
  end

  it 'should ivalid wihtout a post' do
    like = Like.new(author: nil, post: nil)
    expect(like).to_not be_valid
  end
end
