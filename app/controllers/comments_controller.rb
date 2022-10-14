class CommentsController < ApplicationController
	def create
		comment = Comment.new(comment_params)
		if comment.save
			redirect_to request.referer
		else
			#
		end
	end

	def destroy
		comment = Comment.find_by(id: params[:post_id])
		comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
	end
end
