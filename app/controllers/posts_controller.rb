class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each do |user|
      @post = user
    end
  end

  def show; end
end
