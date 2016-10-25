require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a username" do
        user = User.new(email: "email@email.com", password_digest: "dasjfgh")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(username: "username", password_digest: "dasjfgh")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(username: "username", email: "email@email.com")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = User.new(username: "username", email: "email@email.com", password_digest: "dhsgfa")
        expect(user).to be_valid
      end
    end
  end
end
