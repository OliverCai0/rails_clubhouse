class Post < ApplicationRecord
	belongs_to :user
	belongs_to :club
	has_many :comments
end
