################################################################
# Validates from the model
################################################################
# validates :email, presence: true
# validates :password, presence: true
# validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
################################################################

require 'rails_helper'

describe User do

  ########################################################
  # User validation tests
  ########################################################
  context "validation ->" do

    it "all good -> valid" do
      expect(User.new(
        email: "user1@gmail.com",
        password: "user1pw"
      )).to be_valid
    end

    it "no email -> not valid" do
      expect(User.new(
        password: "user1pw"
      )).not_to be_valid
    end

    it "no password -> not valid" do
      expect(User.new(
        email: "user1@gmail.com"
      )).not_to be_valid
    end

    it "bad email format 1 -> not valid" do
      expect(User.new(
        email: "user1gmail.com",
        password: "user1pw"
      )).not_to be_valid
    end

    it "bad email format 2 -> not valid" do
      expect(User.new(
        email: "user1@gmailcom",
        password: "user1pw"
      )).not_to be_valid
    end

  end
end
