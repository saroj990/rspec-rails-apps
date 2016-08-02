require 'faker'
FactoryGirl.define do
  factory :author do |f|
  	f.first_name "John"
  	f.last_name "Doe"
  	f.middle_name "Macc"
	f.email Faker::Internet.email
	f.facebook_url "https://www.facebook.com/john.doe"
	f.twitter_handle "http://www.twitter.com/john_doe"    
  end
end
