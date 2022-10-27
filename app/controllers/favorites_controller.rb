class FavoritesController < ApplicationController
  before_action :get_post

  def create
	set_fav = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	if set_fav.nil?
		favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
		favorite.save
	end
	render turbo_stream: turbo_stream.replace(
		"favorite-btn#{@post.id}#{params[:flag]}",
		partial: 'favorites/show',
		locals: {post: @post, flag: params[:flag]}
	)
  end

  def destroy
	favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	if !favorite.nil?
		favorite.destroy
	end
	render turbo_stream: turbo_stream.replace(
		"favorite-btn#{@post.id}#{params[:flag]}",
		partial: 'favorites/show',
		locals: {post: @post, flag: params[:flag]}
	)
  end

  private
  def get_post
	@post = Post.find_by(id: params[:post_id])
  end
end
