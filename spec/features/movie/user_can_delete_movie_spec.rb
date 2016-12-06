require 'rails_helper'

RSpec.feature "User can delete movie" do
  scenario "they click delete", js: true do
    
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "The Graduate"
    fill_in "Note", with: "I've seen this"
    click_button "Add movie"
    
    expect(Movie.count).to eq(1)
    
    click_link "Delete"
    
    expect(page).to have_content("Movie has been deleted")
    expect(Movie.count).to eq(0)

  end
end