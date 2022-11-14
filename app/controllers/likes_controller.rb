class LikesController < ApplicationController
  def create
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
end
