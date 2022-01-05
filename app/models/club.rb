class Club < ApplicationRecord
	has_many :users
	has_many :posts, through: :users
	has_many :comments, through: :users
end
