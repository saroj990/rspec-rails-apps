require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  it "add a comment"  do 
    comment = FactoryGirl.create(:comment)
    expect(Comment.count).to eq(1)
  end 

  it "is invalid without a text" do 
    comment =  FactoryGirl.build(:comment,text: nil)
    expect(comment).to be_invalid
  end

  it "fails deliberately when comment is less 5 characters" do 
    comment =  FactoryGirl.build(:comment, text:"cool")
    expect(comment).to be_invalid
  end
end
