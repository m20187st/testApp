class FavoritesController < ApplicationController
  before_action :get_post

  def create
	favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
	favorite.save
	redirect_to request.referer
  end

  def destroy
	favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	favorite.destroy
	redirect_to request.referer
  end

  private
  def get_post
	@post = Post.find_by(id: params[:post_id])
  end
end
