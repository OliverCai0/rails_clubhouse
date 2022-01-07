class PostsController < ApplicationController
	before_action :set_clubs, only: [:new] 
	def index
		@post = Post.new
		@posts = Post.all
		@users = {}
		@user_club = UserClub.all
		@clubs = {}
		User.all.each do |user|
			@users[user[:id] ] = user[:username] 
		end
		Club.all.each do |club|
			@clubs[club[:id]] = club[:name]
		end
		@current_user_clubs = {}
		if user_signed_in?
			UserClub.where(user_id: current_user.id).each do |relation|
				@current_user_clubs[Club.find(relation[:club_id])[:name]] = relation[:club_id]
			end 
		end
		@club = Club.new
		@club_bttn = false
	end

	def create
		@club = Club.new
		@club_bttn = true
		# update_post_params = post_params
		# update_post_params[:user] = User.find(update_post_params[:user].to_i)
		@new_post = Post.new(post_params)
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
			params.permit(:title, :content, :user_id, :club_id)
		end

		def set_clubs
			@current_user_clubs = {}
			UserClub.where(user_id: current_user.id).each do |relation|
				@current_user_clubs[relation[:club_id]] = Club.find(relation[:club_id])[:name]
			end 
		end
end
