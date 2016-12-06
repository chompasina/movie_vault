# Click on the tag from that movie and see all the movies associated with that tag

require 'rails_helper'

RSpec.feature "User can click on tag" do
  scenario "they click on tag and see associated movies", js: true do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "West Side Story"
    fill_in "Note", with: "Want to watch"
    fill_in "Tag", with: "love"
    click_button "Add movie"
    
    fill_in "Title", with: "Romeo and Juliet"
    fill_in "Note", with: "Classic"
    fill_in "Tag", with: "love"
    click_button "Add movie"
    
   first('.tags a').click
   
   expect(page).to have_content("Links Tagged with love")
   expect(page).to have_link("Romeo and Juliet")
   expect(page).to have_link("West Side Story")
    
  click_link("Romeo and Juliet")
  
  expect(page).to have_content("Movie: Romeo and Juliet")  
  expect(page).to have_content("Note: Classic")  
  expect(page).to have_content("Watched? false")  
  expect(page).to have_content("Tags: love")  
  end
end