require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

	before(:each)  do 
	    user = FactoryGirl.create(:user)
	    allow(controller).to receive(:authenticate_user!).and_return(true)
	    allow(controller).to receive(:current_user).and_return(user)
	end
	describe "Comment#create" do
		let(:valid_comment_attributes) {{ text: "awesome", user_id: 1, article_id: 1 }}			

		context "with valid attributes" do			
			it "create a new comment" do 				
	  			post :create, { article_id: 1, comment: valid_comment_attributes, format: :js  }
	  			expect(Comment.count).to eq(1)				
			end		
		end 
	end 
end
