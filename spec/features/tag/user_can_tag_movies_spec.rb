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
  
  scenario "User adds more than one tag", js: true do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "To Kill A Mockingbird"
    fill_in "Note", with: "Should re-watch"
    fill_in "Tag", with: "racial issues, love"
    click_button "Add movie"
    
    wait_for_ajax
    
    expect(Movie.count).to eq(1)
    expect(Movie.last.tags.count).to eq(2)
    expect(Movie.last.tag_list).to eq("racial issues, love")
    
    within("#movies-list") do
      expect(page).to have_selector('#movies .tags', text: "racial issues X love X")

      expect(page).to have_content("love")
      expect(page).to have_content("racial issues")
    end
  end
end