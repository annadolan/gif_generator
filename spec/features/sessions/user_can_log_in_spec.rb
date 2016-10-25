require 'rails_helper'

describe "User logs in" do
  scenario "a user can log in to existing account" do
    user = User.create(username: "anna", email: "mail@mail.com", password_digest: "password")

    visit login_path

    fill_in "email", with: "mail@mail.com"
    fill_in "password_digest", with: "password"

    click_button "Login"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome anna")
  end

  scenario "a user tries to log in with an incorrect password" do
    user = User.create(username: "anna", email: "mail@mail.com", password_digest: "password")

    visit login_path

    fill_in "email", with: "mail@mail.com"
    fill_in "password_digest", with: "dshfgdfs"

    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login failed")
  end
end
