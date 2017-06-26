require "rails_helper"
RSpec.describe Article, :type => :model do
	it "is a valid factory" do 
		article = Article.create(:body => "Rspec the begining", :title => "Rspec")
		expect(article).to be_valid
	end

	it "is not a valid  article" do 
		article = Article.create(:body => nil, :title => "Rspec")
		expect(article).to be_invalid
	end

	it "is a valid factory" do 
		user = User.create(:first_name => "joe",last_name: "doe",email: "joe@gmal.com",password: "joedoe")
		article = Article.create(:body => "Rspec the begining", :title => "Rspec",user_id: user.id)
		expect(article.article_user).to eq(user)
	end



end