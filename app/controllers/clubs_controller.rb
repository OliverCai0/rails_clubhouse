class ClubsController < ApplicationController
	before_action :set_clubs, only: [:new] 

	def new
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {render layout: false}
		end
	end

	def create
		@club_bttn = true
		@post = Post.new
		@posts = Post.all
		@users = User.all
		@club = Club.new(clubs_params)
		if @club.save
			UserClub.create(user_id: User.find(params[:user]), club_id: @new_club)
			@club = Club.new
			flash[:success] = 'Successfully created club!'
			redirect_to root_path
		else
			render 'posts/index'
			flash[:error] = 'Club already exists'
		end
	end

	private

	def clubs_params
		params.permit(:name, :desc)
	end

	def set_clubs
			@club = Club.new
		end
end
