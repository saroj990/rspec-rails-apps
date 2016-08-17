require 'rails_helper'
require 'faker'

RSpec.describe 'articles/show.html.erb' do 
  
  # context "with valid parameters" do 
  #   before(:each) do 
  #     assign(:article, FactoryGirl.create(:article, title: "spec",body: "rspec rails"))     
  #     assign(:comment, FactoryGirl.build(:comment))      
  #     render 
  #   end

  #   it "displays the article" do   
  #     expect(rendered).to match /spec/
  #   end

  #   it "display the comment form" do       
  #      expect(rendered).to have_selector("form[method=post]") do |form|
  #         expect(form).to have_selector('input', type: 'submit')
  #       end
  #   end 
  # end

  


  # context "When not found"  do 
  #   it "display no article" do
  #     render 
  #     expect(rendered).to match /Sorry!! we don't have the arictle./
  #   end
  # end
context "renders all the comments" do 
       
    # let!(@comments) {@article.try(:comments)}
    before(:each) do 
      @user = FactoryGirl.create(:user, email: Faker::Internet.email)
      @article = FactoryGirl.create(:article,title: "Rspec",user_id: @user.id)
      @comment =  FactoryGirl.create(:comment,text:"Nice Article",user_id: @user.id,article_id: @article.id) 
    end
    it "renders comments" do      
      render :partial => "/articles/shared/comment_list" , :locals => {:comments => @article.comments}
      expect(rendered).to match(/Nice Article/)
    end

  end

end