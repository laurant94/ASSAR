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
    ActionCable.server.broadcast('post', {
      action: "like",
      post: {
        id: @post.id
      },
      count: @post.likes.liked.size,
      liker: {
        id: like.faithful.id,
        fullname: like.faithful.fullname,
        firstname: like.faithful.firstname,
        lastname: like.faithful.lastname
      },
      message: ""
    })
    render json: {liked: liked}
  end

  def comment
    comment = Comment.new(faithful: current_user, content: params[:comment])
    @post.comments << comment
    # redirect_to me_post_path(@post)
    ActionCable.server.broadcast("post", {
      action: "comment",
      post: {
        id: @post.id
      },
      count: @post.comments.liked.size,
      liker: {
        id: comment.faithful.id,
        fullname: comment.faithful.fullname,
        firstname: comment.faithful.firstname,
        lastname: comment.faithful.lastname
      },
      html: ApplicationController.render(partial: 'me/ui/explorer/single_comment', locals: {
        comment: comment
      }),
      message: ""
    })
    render json: {post: params}
  end

  def favorite
    favorite = @post.favorites.where(faithful: current_user).first
    liked = false
    unless favorite.present?
      favorite = Favorite.new(faithful: current_user)
      @post.favorites << favorite
      liked = true;
    else
      liked = !favorite.liked
      favorite.update_columns(liked: !favorite.liked)
    end
    ActionCable.server.broadcast("post", {
      action: "favorite",
      post: {
        id: @post.id
      },
      count: @post.favorites.liked.size,
      liker: {
        id: favorite.faithful.id,
        fullname: favorite.faithful.fullname,
        firstname: favorite.faithful.firstname,
        lastname: favorite.faithful.lastname
      },
      html: "",
      message: ""
    })
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
