require 'spec_helper'
RSpec.describe "12" do
	before_each{
		article = Article.new
	} 
  context "checks numbers" do
  	it "12 == 12" do 
 		expect(12).to eq(12)
 	end
  end
end