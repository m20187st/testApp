class FavoritesController < ApplicationController
  before_action :get_post

  def create
	favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
	favorite.save
	render :new
  end

  def destroy
	favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	favorite.destroy
	render :new
  end

  private
  def get_post
	@post = Post.find_by(id: params[:post_id])
  end
end
