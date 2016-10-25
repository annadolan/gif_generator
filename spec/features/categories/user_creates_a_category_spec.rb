require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new account" do
    visit new_category_path

    fill_in "category[search_term]", with: "cats"

    click_button "Create Category"

    expect(current_path).to eq("/categories")
    expect(page).to have_content("New category created!")
    expect(page).to have_content("cats")
    expect(Category.count).to eq(1)
  end
end
