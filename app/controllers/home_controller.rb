class HomeController < ApplicationController
 
  def index
    @articles = Article.all
    @trending_articles =  Article.all
  end
end
