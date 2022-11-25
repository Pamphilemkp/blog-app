class CommentsController < ApplicationController
  load_and_authorize_resource

  # Create comment
  def create
    # new object from params
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:id])
    @user_id = current_user.id

    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path
    else
      flash.now[:error] = 'Error creating comment!'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author

    @comment.destroy
    @post.comments_counter -= 1

    redirect_to user_post_path(@user, @post) if @post.save
  end

  private

  def comment_params
    params.require(:form_comment).permit(:text)
  end
end
