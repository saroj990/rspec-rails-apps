FactoryGirl.define do
  factory :user do |f|
    f.first_name "john"
    f.last_name "doe"
    f.email "johndoe@gmail.com"
    f.password "password"
    f.phone_number "7205532612"
  end
end

