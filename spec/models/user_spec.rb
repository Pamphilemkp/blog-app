require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { subject.save }

  it 'should be present and not allowing blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be an integer' do
    subject.posts_counter = 'Likes'
    expect(subject).to_not be_valid
  end

  it 'should be greater or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
