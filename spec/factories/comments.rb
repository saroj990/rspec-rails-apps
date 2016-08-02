FactoryGirl.define do
  factory :comment do |f|
    f.text "Rspec the begining"
    f.user
    f.article
  end
end
