class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user
		if @comment.valid?
			@comment.save
		end
		redirect_to @post
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end	
end
