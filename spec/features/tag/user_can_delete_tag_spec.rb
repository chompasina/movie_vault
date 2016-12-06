require 'rails_helper'

RSpec.feature "User can delete tag" do
  scenario "they can click edit on movie and delete tag from taglist", js: true do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "Contact"
    fill_in "Note", with: "Casey's favorite"
    fill_in "Tag", with: "sci-fi, space, with-Casey, romance"
    click_button "Add movie"
    
    within("#movies-list") do
      expect(page).to have_content("sci-fi X space X with-casey X romance X")
      expect(Movie.last.tags.count).to eq(4)
    end
    
    click_on("Edit")
    fill_in "Tag list", with: "sci-fi, space, with-casey"
    click_button "Submit"
    
    expect(current_path).to eq(movies_path)
    within("#movies-list") do
      expect(page).to have_content("sci-fi X space X with-casey X")
      expect(page).to_not have_content("romance")
      expect(Movie.last.tags.count).to eq(3)
    end
  end
  
  scenario "User clicks 'X' to delete tag from movie", js: true do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"

    fill_in "Title", with: "Contact"
    fill_in "Note", with: "Casey's favorite"
    fill_in "Tag", with: "sci-fi"
    click_button "Add movie"
    
    expect(page).to have_content("sci-fi")
    expect(MovieTag.count).to eq(1)
    
    click_on('X')
    wait_for_ajax

    expect(MovieTag.count).to eq(0)
    
    expect(current_path).to eq(movies_path)
    within("#movies-list") do
      expect(page).to_not have_content("sci-fi")
    end
  end
end