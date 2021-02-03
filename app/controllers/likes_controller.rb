class LikesController < ApplicationController
	def create
		if params[:comment_id]
			@parent = Comment.find(params[:comment_id])
		elsif params[:post_id]
			@parent = Post.find(params[:post_id])
		end
		@like = @parent.likes.new(user: current_user)
		@like.save
		redirect_to request.referrer
	end

	private
	def link_params
		params.require(:link).permit(:comment_id, post_id)
	end	
end
