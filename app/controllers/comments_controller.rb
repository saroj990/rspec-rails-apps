class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end	

	def create 		
		
		if params[:comment].present? && params[:article_id].present?

			@article = find_article(params[:article_id])
			@comment = Comment.new(comment_params)
			@comment.user_id = current_user.id		

			respond_to do |format|
				if @comment.save
					@status ={status:"ok",message: "comment added successfully",errors:[]}
					format.html {notice:"comment added",redirect_to(comments_path)}
					format.js {}
				else
					@result = {status: "error", message: "error", errors: @comment.errors}
					format.html {error:"comment was added",redirect_to(comments_path)}
					format.js {}
				end
			end		
		end
	end
	

	private 
		
		def comment_params
			params.require(:comment).permit(:text,:user_id,:article_id,:is_editable)
		end

		def find_article(id)
			Article.where(id: id).first
		end

end
