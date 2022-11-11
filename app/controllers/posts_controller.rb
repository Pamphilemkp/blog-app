class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
    @user = current_user
    @id = params[:user_id]
  end

  def create
    @user = current_user
    @id = params[:user_id]
    @post = Post.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          # success message
          # redirect to index
          redirect_to "/users/#{@user.id}/posts/#{@post.id}"
        else
          # error message
          # render new
          render :new
        end
      end
    end
    
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end