require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

	describe "GET #index" do
		it "populates an array of articles" do 
			article  = FactoryGirl.create(:article)
			get :index
			assigns(:articles).should eq([article])
		end

		it "renders the :index view" do 
			get :index
			response.should render_template :index
		end

	end

  describe "GET #show" do 
 	 
 	 it "assigns the requested article to @article" do  	

 		article =  FactoryGirl.create(:article)
 		get :show, id: article
 		assigns(:article).should eq(article)

 	 end

 	 it "renders the #show view" do 

 	 	get :show, id: FactoryGirl.create(:article)
 	 	response.should render_template :show

 	 end

  end

end
