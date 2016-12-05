require 'rails_helper'

RSpec.feature "User can edit movies" do
  scenario "User can click to see movie page to edit", js: true do
    user = create(:user)
    movie = user.movies.create(title: "Psycho", note: "Really don't want to see")
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    within('#movies-list') do
      # find('.title-field').click
      click_link "Edit"
      expect(current_path).to eq(edit_movie_path(movie))
    end
  
    fill_in "Title", with: "SKIP"
    click_button "Submit"
    
    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Movie has been updated")
    expect(page).to have_content("SKIP")
    expect(page).to_not have_content("Psycho")
  end

  scenario "User cannot enter title-less movie and submit update" do
    user = create(:user)
    movie = user.movies.create(title: "Star Wars", note: "Seen most of them")

    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    within('#movies-list') do
      # find('.title-field').click
      click_link "Edit"
    end
    
    fill_in "Title", with: ""
    click_button "Submit"
    
    expect(page).to have_content("Title can't be blank")
    end
end