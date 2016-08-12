require 'rails_helper'

RSpec.describe User, type: :model do	
  it "is a valid factory" do 
  	user = FactoryGirl.create(:user)
  	expect(user).to be_valid
  end

  it "return full name as john doe" do
  	user = FactoryGirl.create(:user)
  	expect(user.full_name).to eq("john doe")
  end

  describe "filter by name" do 
  	before(:each) do
			@smith=FactoryGirl.create(:user,email: Faker::Internet.email,last_name: "Smith")
			@jones = FactoryGirl.create(:user,email: Faker::Internet.email,last_name: "Jones") 
			@johnson= FactoryGirl.create(:user,email: Faker::Internet.email,last_name: "Johnson")	
  	end
  	
  	it "returns a sorted array of results that match" do  	
			expect(User.by_letter("J").pluck(:last_name)).to  include('Johnson','Jones')
		end

		it "should sort in ascending order by last_name" do  
			User.asc('last_name').should  == [@johnson,@jones,@smith]
		end
		
		it "fails deliberately for wrong order i,e jones johnson,smith" do 
			User.desc('last_name').should_not == [@jones,@johnson,@smith]
		end

    it "count the number of published article" do 
      expect(@smith.total_articles_published). to eq(0)
    end

  end  
end
