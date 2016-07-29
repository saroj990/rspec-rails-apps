require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
	
	before(:each)  do 
		@article = FactoryGirl.create(:article)
    user = FactoryGirl.create(:user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
	end

	after(:each) do 
		Article.destroy_all
	end

	describe "GET #index" do
    
		it "populates an array of articles" do 			
			get :index
			assigns(:articles).should eq([@article])
		end

		it "renders the :index view" do 
			get :index
			response.should render_template :index
		end

	end

  describe "GET #show" do 
 	 
 	 it "assigns the requested article to @article" do 		
 		get :show, id: @article
 		assigns(:article).should eq(@article)
 	 end

 	 it "renders the #show view" do 
 	 	get :show, id: @article
 	 	response.should render_template :show
 	 end
  end

  describe ".new" do 
  	it "initialize @article" do 		
  		get :new
  		assigns(:article).should be_a_new(Article)
  	end
  end

  describe "#post an article" do 

	context "with valid attributes" do		
		
		it "create a new article" do 
			article_attributes = FactoryGirl.attributes_for(:article)
  			post :create, article: article_attributes
  			expect(Article.count).to eq(2)
			
		end

		it "redirect to index" do 
			post :create, article: FactoryGirl.attributes_for(:article)
			response.should redirect_to root_path
		end	
	end 	

	context "for invalid attributes" do

		it "does not save the record" do 
			expect{post :create ,article: FactoryGirl.attributes_for(:author)}.to_not change(Article,:count)
		end

		it "re-render the new method" do 
			post :create ,article: FactoryGirl.attributes_for(:article, title: nil , body: nil)
			response.should render_template :new
		end
	end
  end

  describe "#PUT update an article" do
  	
  	before(:each) do 
  		@article = FactoryGirl.create(:article,title: "AngularJs Intro", body:"Welcome to AngularJs")
  	end

  	context "valid attributes" do 
  		it "located the requested resource" do 
  			put :update, id:@article , article: FactoryGirl.attributes_for(:article)
      		assigns(:article).should eq(@article)      
  		end
  	end

  	context "with invalid attributes" do 
  		
  		it "does not update the record" do 
  			put :update, id: @article , article: FactoryGirl.attributes_for(:article, title: "How i became your friend", body: nil)
  			@article.reload
  			expect(@article.title).not_to eq("How i became your friend")
  		end

  		it "renders the edit action upon updation failure" do 
  			put :update, id: @article , article: FactoryGirl.attributes_for(:article, title: nil, body: nil)
  			response.should render_template :edit
   		end
  	end

  end

  describe "#DELETE an article" do 
  	
  	before(:each) do 
  		@article =  FactoryGirl.create(:article)
  	end

  	it "delete article" do 
  		expect{delete :destroy, id: @article}.to change(Article,:count).by(-1)  		
  	end

  	it "redirects to article index" do 
  		delete :destroy, id: @article
  		response.should redirect_to root_path
  	end

  	it "respond to json" do 
  		headers = { "CONTENT_TYPE" => "application/json" }
  		delete :destroy, id: @article,format: :json
  	end

  end

end
