require 'rails_helper'

describe "User creates a new user account" do
  scenario "a user can create a new account" do
    visit new_user_path

    fill_in "user[username]", with: "anna"
    fill_in "user[email]", with: "mail@mail.com"
    fill_in "user[password]", with: "password"

    click_button "Create User"

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content("Welcome anna")
    expect(page).to have_content("New user created!")
    expect(User.count).to eq(1)
  end

  scenario "a user tries to create an account with an existing email" do
    User.create(username: "anna", email: "mail@mail.com", password: "dskjfgh")
    visit new_user_path

    fill_in "user[username]", with: "bob"
    fill_in "user[email]", with: "mail@mail.com"
    fill_in "user[password]", with: "password"

    click_button "Create User"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("User already exists, please log in")
    expect(User.count).to eq(1)
  end

  scenario "a user tries to create an account without all attributes" do
    visit new_user_path

    fill_in "user[username]", with: "bob"
    fill_in "user[password]", with: "password"

    click_button "Create User"

    expect(page).to have_content("Please fill in all fields before submitting new user")
    expect(User.count).to eq(0)
  end
end
