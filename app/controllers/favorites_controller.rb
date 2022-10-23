class FavoritesController < ApplicationController
  before_action :get_post

  def create
	favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
	favorite.save

	render turbo_stream: turbo_stream.replace(
		"favorite-btn#{@post.id}",
		partial: 'favorites/show',
		locals: {post: @post}
	)
  end

  def destroy
	favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
	favorite.destroy
	render turbo_stream: turbo_stream.replace(
		"favorite-btn#{@post.id}",
		partial: 'favorites/show',
		locals: {post: @post}
	)
  end

  private
  def get_post
	@post = Post.find_by(id: params[:post_id])
  end
end
