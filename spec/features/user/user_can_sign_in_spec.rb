require 'rails_helper'

RSpec.feature "User can sign in" do
  scenario "User fills in username and password" do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    expect(page).to have_content("Hi, tommasina")
    expect(current_path).to eq(root_path)
  end
end