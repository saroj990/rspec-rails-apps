require 'rails_helper'

RSpec.describe 'Article', type: :model do   

  it "is a valid article" do     
   article =  Article.create(title: "Rspec",body: "Rspec")
   expect(article).to be_valid
  end

  it "is invalid without a body" do     
    article =  Article.create(title: "Rspec",body: nil)
    expect(article).not_to be_valid    
  end

  it "create an article" do 
    article =  Article.create(title: "Rspec",body: "rspec")
    expect(Article.count).to eq(1)
  end

   it ".article_user" do

 end
end