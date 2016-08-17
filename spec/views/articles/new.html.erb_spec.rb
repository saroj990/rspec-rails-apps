require 'rails_helper'
RSpec.describe "articles/new.html.erb",  type: :view do 
  it'renders the article form partial' do 
    @article = Article.new
    render
    expect(rendered).to match /New Article/
  end
end