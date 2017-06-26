require 'rails_helper'

RSpec.describe "Article section" do
  it "/users/sign_in' routes to devise/sessions#new" do 
    expect(:get => "/users/sign_in").to route_to(" devise/sessions#new") 
    expect(get: 'admin/customers').to route_to('admin/users#customers') 
  end  
end