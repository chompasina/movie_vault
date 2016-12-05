require 'rails_helper'

RSpec.feature "User can add tags to movies" do
  scenario "they fill in tags when creating a movie", js: true do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "West Side Story"
    fill_in "Note", with: "Want to watch"
    fill_in "Tag", with: "love"
    click_button "Add movie"
    
    wait_for_ajax
    
    expect(Movie.count).to eq(1)
    expect(Movie.last.tag_list).to eq("love")
    
    within("#movies-list") do
      expect(page).to have_content("love")
    end
  end
end