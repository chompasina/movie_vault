FactoryGirl.define do
  factory :user do
    email 
    username "tommasina"
    password "password"
    password_confirmation "password"
  end
  
  factory :movie do
    title "The Three Lives of Thomasina"
    note "My namesake"
    watched false
    user
  end
  
  sequence :email do |n|
    "person#{n}@example.com"
  end
end
