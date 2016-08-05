class ArticlesController < ApplicationController
	before_action :initialize_variables, only:[:new]
	def new  		
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
		@comment = Comment.new
		find_article
	end

	def update
		if params[:article].present?
			@article = find_article
			
			if @article.update_attributes(article_params)	
				flash[:notice] = "Article was updated successfully!!"		
				redirect_to articles_path
			else						
				render 'edit'
			end
		end
	end

	def destroy		
		@article = find_article				
		if@article			
			@article.destroy
			flash[:notice] = "Article was deleted successfully"			
			respond_to do |format|					
				format.html { redirect_to root_path ,flash[:notice] => "Article was deleted successfully"}
				format.json { render json:{status: true}}
			end		
		end		
	end

	private

	 def article_params
	 	params.require(:article).permit(:body,:cover,:title,:published_on,:is_published,:is_commentable,:user_id )
	 end

	 def find_article  
	 	if params[:id].present?
	 		@article = Article.where(id: params[:id]).first
	 	end	 
	 end

	 def initialize_variables	 	
	 	@article = Article.new		
	 end
end
