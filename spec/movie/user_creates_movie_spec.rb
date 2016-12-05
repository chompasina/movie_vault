require 'rails_helper'

RSpec.feature "User can create movie" do

  scenario "user is on movies index page" do
    user = create(:user)
    
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
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
#   
#   scenario "link has default status of false" do
#     link = create(:link)
# 
#     expect(Link.last.read).to eq(false)
#   end
#   
#   scenario "user gives a broken link" do
#     fill_in "Title", with: "New York Times"
#     fill_in "URL", with: "broken.com"
#     click_button "Add link"
#     
#     expect(page).to have_content("Url is not a valid URL")
#     expect(page).to_not have_content("New York Times")
#     expect(page).to_not have_content("broken.com")
#     expect(Link.count).to eq(0)
#   end
#   
#   scenario "user sees only their own links" do
#     user1 = create(:user)
#     link1 = create(:link, user: user1, url: "http://www.mylink.com", title: "My Link")
#     
#     user2 = create(:user)
#     link2 = create(:link, user: user2, url: "http://www.notmylink.com", title: "Not my link")
#     
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
#     
#     visit root_path
#     expect(page).to have_content("My Link")
#     expect(page).to have_content("http://www.mylink.com")
#     expect(page).to_not have_content("Not my link")
#     expect(page).to_not have_content("http://www.notmylink.com")
#   end
end