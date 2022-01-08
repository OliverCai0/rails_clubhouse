class Club < ApplicationRecord
	validates :name, uniqueness: true
	has_many :user_clubs, dependent: :destroy
	has_many :users, through: :user_clubs
	has_many :posts, through: :users, dependent: :destroy
	has_many :comments, through: :users
end
