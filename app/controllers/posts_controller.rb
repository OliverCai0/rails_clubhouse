class PostsController < ApplicationController
	def index
		@post = Post.new
		@posts = Post.all
		@users = {}
		User.all.each do |user|
			@users[user[:id]] = {:username => user[:username]}
		end
		@current_user_clubs = []
		@club = Club.new
		@club_bttn = false
	end

	def create
		@club = Club.new
		@club_bttn = true
		update_post_params = post_params
		update_post_params[:user] = User.find(update_post_params[:user].to_i)
		@new_post = Post.new(update_post_params)
		if @new_post.save
			@post = Post.new
			@posts = Post.all
			@users = User.all
			flash[:success] = 'Successfully uploaded post!'
			redirect_to root_path
		else
			@posts = Post.all
			@users = User.all
			redirect_to root_path
		end
	end

	def new
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {render layout: false}
		end
	end
	private
		def post_params
			params.require(:post).permit(:title, :content, :user)
		end
end
