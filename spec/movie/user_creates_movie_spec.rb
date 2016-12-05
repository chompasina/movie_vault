require 'rails_helper'

RSpec.feature "User can create movie" do

  scenario "user is on movies index page" do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Title", with: "The Godfather"
    fill_in "Note", with: "Classic that I've never seen"
    click_button "Add movie"
    
    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Classic that I've never seen")
    expect(Movie.count).to eq(1)
  end
  
  scenario "movie has default status of false" do
    movie = create(:movie)

    expect(Movie.last.watched).to eq(false)
  end
  
  scenario "user gives an invalid movie" do
    user = create(:user)
    
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    fill_in "Note", with: "Should watch"
    click_button "Add movie"
    
    expect(page).to have_content("Title can't be blank")
    expect(page).to_not have_content("Gone with the Wind")
    expect(page).to_not have_content("Should watch")
    expect(Movie.count).to eq(0)
  end
  
  scenario "user sees only their own movies" do
    user1 = create(:user)
    movie1 = create(:movie, user: user1, title: "Casablanca", note: "My fave")
    
    user2 = create(:user)
    movie2 = create(:movie, user: user2, title: "The Wizard of Oz", note: "Not my fave")
        
    visit root_path
    fill_in "Username", with: "tommasina"
    fill_in "Password", with: "password"
    click_button "Login"
    
    expect(page).to have_content("My fave")
    expect(page).to have_content("Casablanca")
    expect(page).to_not have_content("The Wizard of Oz")
    expect(page).to_not have_content("Not my fave")
  end
end