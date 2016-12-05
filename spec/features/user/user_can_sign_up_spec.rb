require 'rails_helper'

RSpec.feature "Unauth. user can sign up" do
  scenario "user is prompted to sign up or login" do
    visit root_path
    expect(current_path).to eq(login_path)  
    expect(page).to have_content("Sign Up")
  end
  
  scenario "user visits root and clicks to sign up" do
    visit root_path
    
    click_on("Sign Up")
    
    expect(current_path).to eq(new_user_path)
    expect(page).to_not have_content("Welcome, Tommasina")
    expect(page).to_not have_content("Logout")

    fill_in "Username", with: "Tommasina"
    fill_in "Email", with: "Tommasina@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on("Create Account")
    
    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Your account was successfully created, Tommasina")
    expect(page).to have_content("Welcome, Tommasina")
    expect(page).to have_link("Logout")
  end
  
  scenario "user must have a unique email address" do
    user = create(:user, email: "person1@example.com") #creates first user with this email
    
    visit root_path    
    click_link "Sign Up"
    
    fill_in "Username", with: "Tommasina"
    fill_in "Password", with: "password"
    fill_in "Email", with: "person1@example.com" #creates second user with this email
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"
    
    expect(page).to have_content("Email has already been taken")
  end
  
  scenario "user password and confirmation must match" do
    visit root_path    
    click_link "Sign Up"
    
    fill_in "Username", with: "Tommasina"
    fill_in "Password", with: "password"
    fill_in "Email", with: "tom@gmail.com" #creates second user with this email
    fill_in "Password confirmation", with: "wrongpassword"
    click_on "Create Account"
    
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end