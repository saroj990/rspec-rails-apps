require 'rails_helper'

RSpec.describe "articles/index.html.erb", tyoe: :view do 
  it "renders all the  articles" do 
    assign(:articles,[
      article1 = FactoryGirl.create(:article,title: "rspec"),
      article2 = FactoryGirl.create(:article,title: "capybara")]
      )
    render

    expect(rendered).to match /rspec/
    expect(rendered).to match /capybara/
  end

  it "display no article found if nothing is there" do 
      render

      expect(rendered).to match /No article founds/
  end
end