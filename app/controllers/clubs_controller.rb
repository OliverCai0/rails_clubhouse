class ClubsController < ApplicationController
	before_action :set_clubs, only: [:new] 

	def info
		render 'clubs/info'
	end

	def index
		@clubs = Club.all
	end

	def new
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {render layout: false}
		end
	end

	def show
		@club = Club.find(params[:id])
		@in_club = @club.users.include?(current_user)
		respond_to do |format|
			format.html {redirect_to clubs_path}
			format.js {render layout: false}
		end
	end

	def signup
		if Club.find(params[:club_id]).code == params[:code]
			@new_relation = UserClub.new(user_id: current_user.id, club_id: params[:club_id])
			if @new_relation.save
				flash[:success] = 'Successfully joined'
			else
				flash[:error] = 'Code success, but user account bugged'
			end
		else
			flash[:error] = 'Wrong code'
		end
		redirect_to clubs_path
	end

	def create
		@club_bttn = true
		@post = Post.new
		@posts = Post.all
		@users = User.all
		@club = Club.new(clubs_params)
		if @club.save
			new_relation = UserClub.new(user_id: params[:user], club_id: @club[:id])
			new_relation.save
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
		params.permit(:name, :desc, :code)
	end

	def set_clubs
			@club = Club.new
		end
end
