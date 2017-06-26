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

  it "is not a valid factory" do 
    article = FactoryGirl.build(:article,title: nil)
    expect(article).to be_valid
  end


  it "has a valid body and title" do 
  	article =  FactoryGirl.build(:article)
  	expect(article.title).to eq("New Title")
  	expect(article.body).to eq("New Body")
  end

  it "is invalid without a title" do 
  	article =  FactoryGirl.build(:article,:title => nil)
  	expect(article).to be_invalid
  end

  it "is invalid without a body" do 
  	article =  FactoryGirl.build(:article,:title => nil,:body => nil)
  	expect(article).to be_invalid
  end

  it "is invalid when duplicate title" do 
  	article1 = FactoryGirl.build(:article,:title => "Rspec rails",:body => "Here we go")
  	article2 =  FactoryGirl.build(:article,:title => "Rspec rails",:body => "Here we go")
  	expect(article2.errors).to be_truthy
  end

  # with factory girl sample model 
  it "is a valid factory" do 
    article = Article.create(title: "Rspec basic", body:"No content")
    expect(article).to be_valid
  end

  it "is invalid without title" do
    article = Article.create(title: "Rspec basic",body:nil)
    expect(article).to be_invalid
  end

  it "add a new article and count increase by 1" do 
    article =  Article.create(title: "Data abstraction", body: "No conent")
    expect(Article.count).to eq(1)
  end
end

