require 'rails_helper'

RSpec.feature "User can sort movie by alphabet" do
  scenario "User clicks sort button", js: true do
    user = create(:user)
    link = create(:movie, user: user, title: "Zebra")
    link2 = create(:movie, user: user, title: "Apple")
    link3 = create(:movie, user: user, title: "Monkey")
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    within("#movies") do
      expect(page).to have_selector('#movies tr:nth-child(1) .title-field', text: "Zebra")
      expect(page).to have_selector("#movies tr:nth-child(2) .title-field", text: "Apple")
      expect(page).to have_selector("#movies tr:nth-child(3) .title-field", text: "Monkey")
    end
    
    click_on "Sort"
    wait_for_ajax
    
    within("#movies") do
      expect("Apple").to appear_before("Zebra")
      expect("Monkey").to appear_before("Zebra")
    end
  end
end