FactoryGirl.define do
  factory :user do
    username "bob"
    email "bob@gmail.com"
    password "1234567"
    admin false
  end
  factory :admin do
    username "mradmin"
    email "mradmin@gmail.com"
    password "1234567"
    admin true
  end
end
