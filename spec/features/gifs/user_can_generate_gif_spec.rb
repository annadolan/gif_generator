require 'rails_helper'

describe "User generates a new gif" do
  scenario "a user can generate a gif" do
    visit new_gif_path

    fill_in "category[search_term]", with: "cats"

    click_on "Generate GIF"

    expect(current_path).to eq("/gifs")
    expect(page).to have_content("New gif generated!")
    expect(Gif.count).to eq(1)
  end
end
