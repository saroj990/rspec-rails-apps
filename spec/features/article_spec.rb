require 'spec_helper'

describe 'Feature spec Article' do 
	describe "Manage Article" do 
		
		it "Adds new article and display the result" do 
			visit articles_url

			expect{
				click_link "New Article"
				fill_in 'article_title', with: "Sample Rspec Usage"
				fill_in 'article_body',  with: "I will add it later"
				click_button "Create Article"
			}.to change(Article,:count).by(1)

			page.should has_content?("Article was created successfully")
		end

		it "Deletes an article" do 			
			article =  FactoryGirl.create(:article,title: "Faker usage",body: "i will add it later")
			visit articles_url
			expect{
				within "#article_#{article.id}" do
      				click_button "Delete"
      			end
			}.to change(Article, :count).by(-1)

			page.should have_content "Article was deleted successfully"
		end

	end
end