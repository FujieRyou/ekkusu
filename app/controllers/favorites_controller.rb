class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.includes(:post)
  end
  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
    redirect_to request.referrer
  end

  def destroy
    user = User.find(params[:id])
    current_user.unlike(user)
    redirect_to request.referer
  end
end
