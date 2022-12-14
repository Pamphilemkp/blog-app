class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request

  def index
    @post = Post.find(params[:post_id])
    @comment = @post.comments

    render json: @comment
  end

  def create
    @post = Post.find(params[:post_id])

    return unless @post.comments.create(text: params[:comment][:text], author: @current_user)

    render json: { success: 'Comment created successfully' }
  end
end
