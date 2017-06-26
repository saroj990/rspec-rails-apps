require 'rails_helper'
RSpec.describe 'User routes', type: :routing do 
  it "GET /users/sign_in" do 
    expect(:get => "/users/sign_in").to route_to(controller: "devise/sessions",action: "new")
  end

  it " POST /users/sign_in to sessions/create" do
    expect(:post => "/users/sign_in").to route_to(controller: "devise/sessions",action: "create")
  end 
end