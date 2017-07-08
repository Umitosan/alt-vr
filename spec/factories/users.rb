FactoryGirl.define do
  factory :user do
    username "bob"
    email "bob@gmail.com"
    password "1234567"
    admin true
  end
end
