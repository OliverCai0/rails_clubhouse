class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comments_param)
		if @comment.save
			@comment = Comment.new
			flash[:success] = 'Successfully uploaded comment'
		else
			flash[:comment_error] = 'Comment not uploaded'
		end
		redirect_to root_path
	end

	private 
	def comments_param
		params.require(:comment).permit(:user_id, :content, :post_id)
	end
end
