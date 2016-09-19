require 'rails_helper'
include Warden::Test::Helpers             ## including some warden magic
Warden.test_mode!

feature 'Feature spec Article' do 
	feature "Manage Article" do 
		before :each do
			Article.destroy_all
			user = FactoryGirl.create(:user)
      login_as(user,scope: :user)		   
		end
		scenario "Adds new article and display the result" do 
			visit articles_url

			expect{
				click_link "New Article"
				fill_in 'article_title', with: "Sample Rspec Usage"
				fill_in 'article_body',  with: "I will add it later"
				click_button "Create Article"
			}.to change(Article,:count).by(1)

			expect(page).to have_content("Article was created successfully")
		end

		scenario "Deletes an article" do 			
			@article =  FactoryGirl.create(:article,title: "Faker usage",body: "i will add it later")
			visit articles_url
			expect{
				within "#tblArticle" do
					delete_button = page.find("#article_#{@article.id}")	
					delete_button.click
      			end
			}.to change(Article, :count).by(-1)

			 expect(page).to have_content("Article was deleted successfully")
			#expect(page.current_url).to eq(root_path)
		end

		scenario "Show an article" do 
			@article = FactoryGirl.create(:article)
			visit articles_url

			expect{
				within "#tblArticle" do 
					show_button = page.find("#show_article_#{@article.id}")
					show_button.click
				end
			}.to change(Article,:count).by(0)

			expect(page.current_url).to eq(article_url(@article))
		end

		scenario "Edit an article" do 
			@article = FactoryGirl.create(:article)
			visit articles_url
			
			within "#tblArticle" do 
				edit_button = page.find("#show_article_#{@article.id}")
				edit_button.click
			end
			visit edit_article_url(@article)

			expect{

				fill_in "article_title", with: "Rspec Feature spec with capybara"
				fill_in "article_body", with: "content"
				click_button "Update Article"
				}.to change(Article,:count).by(0)
			
			expect(page).to have_content("Article was updated successfully")
			expect(page.current_url).to eq(articles_url)
		end
	end
end