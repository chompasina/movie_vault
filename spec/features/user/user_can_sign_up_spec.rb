require 'rails_helper'

RSpec.feature "User can sign up" do
  scenario "user visits root and clicks to sign up" do
    visit root_path
    
    expect(current_path).to eq(login_path)
    
    click_on("Sign up")
    
    expect(current_path).to eq(new_user_path)
    fill_in "Username", with: "Tommasina"
    fill_in "Email", with: "Tommasina@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on("Create Account")
    
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Your account was successfully created")
    expect(page).to have_content("Welcome, Tommasina")
  end
end