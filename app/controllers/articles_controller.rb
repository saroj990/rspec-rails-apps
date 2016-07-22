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
				redirect_to root_path
			else				
				render 'new'
			end
		end
	end

	def edit 
	end

	def show
		if params[:id].present?
			@article =  Article.where(id: params[:id]).first
		end		
	end

	def update
	end

	def destroy
	end

	private

	 def article_params
	 	params.require(:article).permit(:body,:title,:published_on,:is_published,:is_commentable,:author_id )
	 end
end
