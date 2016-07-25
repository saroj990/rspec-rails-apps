class ArticlesController < ApplicationController
	def new  
		@article = Article.new		
	end

	def index
		@articles = Article.all
	end

	def create
		if params[:article].present?
			@article = Article.new(article_params)

			if @article.save		
				flash[:notice]	= "Article was created successfully"
				redirect_to root_path
			else				
				render 'new'
			end
		end
	end

	def edit 
		find_article
	end

	def show
		find_article
	end

	def update
		if params[:article].present?
			@article = find_article
			
			if @article.update_attributes(article_params)				
				redirect_to root_path

			else						
				render 'edit'
			end
		end
	end

	def destroy
		@article = find_article		
		@article.destroy

		respond_to do |format|			
			format.html { redirect_to root_path }
			format.json { render json:{status: true}}
		end		
	end

	private

	 def article_params
	 	params.require(:article).permit(:body,:title,:published_on,:is_published,:is_commentable,:author_id )
	 end

	 def find_article  
	 	if params[:id].present?
	 		@article = Article.where(id: params[:id]).first
	 	end	 
	 end
end
