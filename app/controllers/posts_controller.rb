class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.includes(:comments).includes(:likes)
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.includes(:likes)
		@comment = Comment.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.valid?
			@post.save
		end
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end
