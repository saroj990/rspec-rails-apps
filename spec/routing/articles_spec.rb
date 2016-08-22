require 'rails_helper'

RSpec.describe "Article routes",:type => :routing do  
  
  it "index /articles/index" do 
    expect(:get => "/articles").to route_to(:controller => "articles",:action => "index")
  end

  it "article/new" do 
    expect(:get => "/articles/new").to route_to(:controller => "articles",:action => "new")
  end

  it "article/create" do 
    expect(:post => "/articles").to route_to(:controller => "articles",:action => "create")
  end  

  it  "edit article /articles/12/edit " do 
    expect(:get => "/articles/12/edit").to route_to(:controller => "articles", :action => "edit", :id => '12')
  end

  it  "update article /articles/12 " do 
    expect(:patch => "/articles/12").to route_to(:controller => "articles", :action => "update", :id => '12')
  end

  it  "update article /articles/12 " do 
    expect(:put => "/articles/12").to route_to(:controller => "articles", :action => "update", :id => '12')
  end

  it "show article /articles/12" do 
    expect(:get => "/articles/12").to route_to(:controller => "articles", :action => "show",:id => "12")
  end

  it "deletes article /article/12" do 
    expect(:delete => "/articles/12").to route_to(:controller => "articles", :action => "destroy", :id => "12")
  end

  it "/show_article not to be routable" do 
    expect(:get => "/articles/show_article/12").not_to be_routable
  end

end