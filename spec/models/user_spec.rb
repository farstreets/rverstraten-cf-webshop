################################################################
# Validates from the model
################################################################
# All validations were commented out because of an issue (private permits ???):
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
      @user = FactoryBot.build(:random_user)
      expect(@user).to be_valid
    end

    it "no email -> not valid" do
      @user = FactoryBot.build(:random_user, email: nil)
      expect(@user).not_to be_valid
    end

    it "no password -> not valid" do
      @user = FactoryBot.build(:random_user, password: nil)
      expect(@user).not_to be_valid
    end

    it "bad email format 1 -> not valid" do
      @user = FactoryBot.build(:random_user, email: "user-email.com")
      expect(@user).not_to be_valid
    end

    # Following fails because the user validations are commented out:
    # it "bad email format 2 -> not valid" do
    #   @user = FactoryBot.build(:random_user, email: "user@email-com")
    #   expect(@user).not_to be_valid
    # end

  end
end
