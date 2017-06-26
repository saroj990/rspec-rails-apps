require 'rails_helper'

RSpec.describe "articles/edit.html.erb" do 
  before(:each) do
    @article = FactoryGirl.create(:article, title: "Rspec rails", body: "welcome to rspec!!!")
    render
  end

  it "renders edit view" do       
    expect(rendered).to have_selector('form')
    expect(rendered).to match /Edit Article/    
  end
  
end