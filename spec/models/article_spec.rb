require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "is a valid article" do 
    article = Article.create(title: "New title", body: 'New Body')
    expect(article).to be_valid
  end
  it "is a new article" do 
    article =  Article.new(title: "New article title", body:"New article body")
    expect(article).to be_a_new(Article)
  end

  it "is invalid without a title" do 
    article = Article.new(title: nil,body: "Nice Body")
    expect(article).to be_invalid
  end
end
