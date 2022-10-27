class PostsController < ApplicationController
  def index
	@posts = Post.order(created_at: :desc).limit(10)
	if user_signed_in?
		@favorite_posts = Post.includes(:favorites).where(favorites: {user_id: current_user.id}).order('favorites.created_at desc').limit(10)
		@user_posts = Post.where(user_id: current_user.id).order(created_at: :desc).limit(10)
	end
  end

  def show
	@post = Post.find(params[:id])
	@comment = Comment.new
	@comments = Comment.where(post_id: params[:id])
  end

  def new
	@post = Post.new
  end

  def create
	@post = Post.new(post_params)
	if @post.save
		redirect_to @post
	else
		#render :new
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
		#render :new, status: :unprocessable_entity
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
