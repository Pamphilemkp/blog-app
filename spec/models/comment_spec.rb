require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should ivalid wihtout an author' do
    comment = Comment.new(author: nil)
    expect(comment).to_not be_valid
  end

  it 'should ivalid wihtout a post' do
    comment = Comment.new(author: nil, post: nil)
    expect(comment).to_not be_valid
  end
end
