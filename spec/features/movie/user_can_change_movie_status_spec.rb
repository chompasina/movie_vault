require 'rails_helper'

RSpec.feature "User can change movie status", :js => true do
  scenario "user can click to change unwatched status to watched" do
    user = create(:user)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "The Graduate"
    fill_in "Note", with: "I've seen this"
    click_button "Add movie"
    
    within("#movies-list") do
      expect(Movie.last.watched).to eq(false)
      expect(page).to have_content("Watched? false")
      click_button "Mark as Watched"
      wait_for_ajax

      expect(Movie.last.watched).to eq(true)
      expect(page).to_not have_content("Watched? false")
      expect(page).to have_content("Watched? true")
    end
  end
  
  scenario "user can click to change watched status to unwatched" do
    user = create(:user)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "The African Queen"
    fill_in "Note", with: "I've never seen this"
    click_button "Add movie"
    
    within("#movies-list") do
      click_button "Mark as Watched"
      wait_for_ajax
      expect(Movie.last.watched).to eq(true)

      click_button "Mark as Unwatched"
      wait_for_ajax
      
      expect(page).to have_content("Watched? false")
      expect(page).to_not have_content("Watched? true")
    end
  end
end