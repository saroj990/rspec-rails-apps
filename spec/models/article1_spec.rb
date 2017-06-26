require 'rails_helper'
RSpec.describe "Article" do 
	it "is a valid article" do 
		article =  Article.create(:title => "Rspec The begininng",:body => "I will addd it later");
		expect(article).to be_valid
	end

	it "should have a title" do 
		article =  Article.create(:title => "Rspec is good",:body => "I will addd it later");
		expect(article).to be_valid
	end

	it ".aritcle_user" do 
		user = User.create(:first_name => "fake",:last_name => "fake",email: "fake@faker.com",password:"password")
		article =  Article.create(:title => "Rspec is good",:body => "I will addd it later",user_id: user.id);
		expect(article.article_user).to eq(user)

	end
end