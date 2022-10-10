class FavoritesController < ApplicationController
  before_action :get_post

  def create
	favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
	favorite.save
	redirect_to @post
  end

  def destroy
	favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	favorite.destroy
	redirect_to @post
  end

  private
  def get_post
	@post = Post.find_by(id: params[:post_id])
  end
end
