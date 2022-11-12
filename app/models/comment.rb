class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  validates :text, presence: true, allow_blank: false

  after_save :update_post_comments_counter

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
