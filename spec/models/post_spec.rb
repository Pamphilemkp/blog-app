require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    author = User.create(
      name: 'Justine Rey',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Argentina.',
      posts_counter: 1
    )

    subject do
      Post.new(title: 'Mock ruby on rails test ', text: 'check app functionality', author:, likes_counter: 0,
               comments_counter: 0)
    end

    before { subject.save }

    it 'should be present and not allowing blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have a maximum length of 250' do
      subject.text = 'Likes'
      expect(subject).to be_valid
    end

    it 'should be numerical' do
      subject.comments_counter = 'hello'
      expect(subject).to_not be_valid
    end

    it 'should be an integer and greater than or equal to zero' do
      subject.comments_counter = -9
      expect(subject).to_not be_valid
    end

    it 'should be numerical' do
      subject.likes_counter = 'hello'
      expect(subject).to_not be_valid
    end

    it 'should be an integer and greater than or equal to zero' do
      subject.likes_counter = -9
      expect(subject).to_not be_valid
    end
  end
end
