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
    @post = Post.create(post_params)
    @user = current_user
    @post.author_id = @user.id

    # respond_to block
    respond_to do |f|
      f.html do
        if @post.save
          flash[:success] = 'Post created successfully!'
          redirect_to "/users/#{@user.id}/posts/"
        else
          flash.now[:error] = 'Error creating post!'
          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:form_comment).permit(:text)
  end
end
