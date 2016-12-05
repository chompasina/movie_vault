FactoryGirl.define do
  factory :user do
    email 
    username "tommasina"
    password "password"
    password_confirmation "password"
  end
  
  sequence :email do |n|
    "person#{n}@example.com"
  end
end
