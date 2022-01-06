class Club < ApplicationRecord
	validates :name, uniqueness: true
	has_many :user_clubs
	has_many :users, through: :user_club
	has_many :posts, through: :users
	has_many :comments, through: :users
end
