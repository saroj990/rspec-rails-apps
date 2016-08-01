class CommentsController < ApplicationController
	def new
	end	

	def create 		
		
		if params[:comment].present? && params[:article_id].present?

			@article = find_article(params[:article_id])
			@comment = Comment.new(comment_params)
			@comment.user_id = current_user.id		
			
			if @comment.save
				flash[:notice] =  "comment added successfully!!"
				@result = {status:"ok",message: "comment added successfully",errors:[]}				
			else
				@result = {status: "error", message: "error", errors: @comment.errors}
			end
		end
	end
	

	private 
		
		def comment_params
			params.require(:comment).permit(:text,:user_id,:article_id)
		end

		def find_article(id)
			Article.where(id: id).first
		end

end
