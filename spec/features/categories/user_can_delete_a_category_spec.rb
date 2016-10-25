require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete an existing category" do
    category = Category.create(search_term: "cats")

    visit categories_path

    expect(page).to have_content("cats")

    within(".category_#{category.id}") do
      click_on "Delete"
    end

    expect(page).to_not have_content("cats")
  end
end
