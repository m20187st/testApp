class PostsController < ApplicationController
  def index
	@posts = Post.all
	if user_signed_in?
		@favorite_lists = Favorite.where(user_id: current_user.id)
	end
  end

  def show
	@post = Post.find(params[:id])
	@favorited_sum = Favorite.where(post_id: params[:id]).count
  end

  def new
	@post = Post.new
  end

  def create
	@post = Post.new(post_params)
	if @post.save
		redirect_to @post
	else
		render :new, status: :unprocessable_entity
	end
  end

  def edit
	@post = Post.find(params[:id])
  end

  def update
	@post = Post.find(params[:id])
	if @post.update(post_params)
		redirect_to @post
	else
		render :new, status: :unprocessable_entity
	end
  end

  def destroy
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to root_path
  end

  private
  	def post_params
		params.require(:post).permit(:text).merge(user_id: current_user.id)
	end
end
