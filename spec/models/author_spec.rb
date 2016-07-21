require 'rails_helper'

RSpec.describe Author, :type => :model do
  

  it "is a valid factory" do 
  	author = FactoryGirl.create(:author)
  	expect(author).to be_valid
  end

  it "return full name as john doe" do
  	author = FactoryGirl.create(:author)
  	expect(author.name).to eq("john doe")
  end

  describe "filter by name" do 
  	before(:each) do
			@smith=FactoryGirl.create(:author,last_name: "Smith")
			@jones = FactoryGirl.create(:author,last_name: "Jones") 
			@johnson= FactoryGirl.create(:author,last_name: "Johnson")	
  	end

  	it "returns a sorted array of results that match" do  	
			expect(Author.by_letter("J").pluck(:last_name)).to  include('Johnson','Jones')
		end

		it "should sort ascending order the array by last_name" do  
			Author.asc('last_name').should  == [@johnson,@jones,@smith]
		end
		
		it "fails deliberately for wrong order i,e jones johnson,smith" do 
			Author.desc('last_name').should_not == [@jones,@johnson,@smith]
		end
  end
end
