require 'rails_helper'
include Warden::Test::Helpers             ## including some warden magic
Warden.test_mode!

RSpec.describe 'Article management', type: :request do 

  before(:each) do 
    @user =  FactoryGirl.create(:user)
    login_as(@user)
  end

 it 'creates a new article and redirects to articles list page' do   
  get '/articles/new'
  expect(response).to render_template(:new)

  article_attributes = FactoryGirl.attributes_for(:article)
  post "/articles", article: article_attributes,user: @user
  expect(Article.count).to eq(1)

  expect(response).to redirect_to(articles_url)
  get: new 

 end

end