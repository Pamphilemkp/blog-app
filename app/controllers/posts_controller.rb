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

  # Create comment
  def comment_post
    # new object from params
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:id])

    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path
    else
      flash.now[:error] = 'Error creating comment!'
      render :new
    end
  end

  def like_post
    @post = Post.find(params[:id])
    # new object from params
    @like = Like.new(author_id: current_user.id, post_id: @post.id)
    if @like.save
      flash[:success] = 'You liked the post!'
      redirect_to user_post_path
    else
      flash.now[:error] = 'Error: Post could not be liked'
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
