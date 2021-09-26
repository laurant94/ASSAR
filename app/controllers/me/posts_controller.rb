class Me::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :like, :comment, 
    :favorite]
  def index
    @posts = Me::Post.order(id: :DESC).filtered(params[:type])
  end

  def show
  end

  def update
  end

  def like
    like = @post.likes.where(faithful: current_user).first
    liked = false
    unless like.present?
      @post.likes << Like.new(faithful: current_user)
      liked = true;
    else
      liked = !like.liked
      like.update_columns(liked: !like.liked)
    end
    render json: {liked: liked}
  end

  def comment
    content = params.require(:comment).permit(:content)[:content]
    @post.comments << Comment.new(faithful: current_user, content: content)
    redirect_to me_post_path(@post)
  end

  def favorite
    like = @post.favorites.where(faithful: current_user).first
    liked = false
    unless like.present?
      @post.favorites << Favorite.new(faithful: current_user)
      liked = true;
    else
      liked = !like.liked
      like.update_columns(liked: !like.liked)
    end
    render json: {liked: liked}
  end

  def favorites
    @posts = current_user.favorites.liked
  end

  def calendar
    # @posts = current_user
  end

  private
  def set_post
    @post = Me::Post.find(params[:id])
  end
end
