require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a search term" do
        category = Category.new()
        expect(category).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with a search term" do
        category = Category.new(search_term: "cats")
        expect(category).to be_valid
      end
    end
  end
  describe "relationships" do
    it "has many gifs" do
      category = Category.new(search_term: "cats")
      expect(category).to respond_to(:gifs)
    end
  end
end
