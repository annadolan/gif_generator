require 'rails_helper'

describe "User generates a new gif" do
  scenario "a user can generate a gif" do
    category = Category.create(search_term: "cats")
    visit new_gif_path

    fill_in "search_term", with: "cats"

    click_on "Search"

    expect(current_path).to eq("/gifs/1")
    expect(page).to have_content("New gif generated!")
    expect(Gif.count).to eq(1)
  end
end
