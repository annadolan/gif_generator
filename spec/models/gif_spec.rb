describe Gif do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an image path" do
        gif = Gif.new()
        expect(gif).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with image path" do
        gif = Gif.new(image_path: "imagepath.gif")
        expect(gif).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a category" do
      gif = Gif.new(image_path: "imagepath.gif")
      expect(gif).to respond_to(:category)
    end
  end
end
