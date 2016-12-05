require 'rails_helper'

RSpec.feature "User can filter by word" do
  scenario "user searches by title and irrelevant movies disappear", js: true do
    user = create(:user)
    searched_movie = create(:movie, user: user, title: "Bonnie and Clyde", note: "Seems worthwhile")
    non_searched_movie = create(:movie, user: user, title: "Dr. Strangelove", note: "I've seen it")
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    expect(page).to have_content("Bonnie and Clyde") 
    expect(page).to have_content("Dr. Strangelove")
    
    fill_in "search-bar", with: "Bonnie" 
    
    expect(page).to have_content("Bonnie and Clyde")
    expect(page).to_not have_content("Dr. Strangelove")
  end
    
    scenario "user searches by note and irrelevant movies disappear", js: true do
      user = create(:user)
      searched_movie = create(:movie, user: user, title: "Bonnie and Clyde", note: "Seems worthwhile")
      non_searched_movie = create(:movie, user: user, title: "Dr. Strangelove", note: "I've seen it")
      
      visit root_path
      fill_in "Username", with: "tommasina"
      fill_in "Password", with: "password"
      click_button "Login"

      expect(page).to have_content("Seems worthwhile") 
      expect(page).to have_content("I've seen it")
      
      fill_in "search-bar", with: "Seems" 
      
      expect(page).to have_content("Seems worthwhile")
      expect(page).to_not have_content("I've seen it")
  end    
end