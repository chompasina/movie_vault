require 'rails_helper'

RSpec.feature "User filters by status" do
  scenario "user clicks a button to sort by watched", js: true do
    user = create(:user)
    movie = create(:movie, user: user, title: "Annie Hall", watched: true)
    movie2 = create(:movie, user: user, title: "High Noon", watched: false)

    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    expect(page).to have_content("Annie Hall")
    expect(page).to have_content("High Noon")
    
    within(".filter-by-status") do
      click_button "Watched"
    end

    expect(page).to have_content("Annie Hall")
    expect(page).to_not have_content("High Noon")
    
    within(".filter-by-status") do
      click_button "Unwatched"
    end

    expect(page).to_not have_content("Annie Hall")
    expect(page).to have_content("High Noon")
  end
end