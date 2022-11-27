class Api::V1::PostsController < ApplicationController
  before_action :authenticate_request
  def index
    @posts = Post.where(author_id: params[:user_id]).includes(:comments)
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end
end
