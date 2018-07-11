################################################################
# Validates from the model
################################################################
# validates :body, presence: true
# validates :user, presence: true
# validates :product, presence: true
# validates :rating, numericality: { only_integer: true }
################################################################

require 'rails_helper'

describe Comment do

  ########################################################
  # Comment validation tests
  ########################################################
  context "validation ->" do

    before(:each) do
      @user = FactoryBot.create(:random_user)
      @product = FactoryBot.create(:random_product)
    end

    it "all good -> valid" do
      @comment = FactoryBot.create(:random_comment,
        user_id: @user.id,
        product_id: @product.id
      )
      expect(@comment).to be_valid
    end

    it "no rating -> invalid" do
      # Factories don't work for this test -> They do not allow empty/nil fields
      expect(Comment.new(
        body: "b",
        user_id: @user.id,
        product_id: @product.id
      )).not_to be_valid
    end

    it "no body -> invalid" do
      # Factories don't work for this test -> They do not allow empty/nil fields
      expect(Comment.new(
        user_id: @user.id,
        product_id: @product.id,
        rating: 3
      )).not_to be_valid
    end

    it "no user_id -> invalid" do
      # Factories don't work for this test -> They do not allow empty/nil fields
      expect(Comment.new(
        body: "b",
        product_id: @product.id,
        rating: 3
      )).not_to be_valid
    end

    it "no product_id -> invalid" do
      # Factories don't work for this test -> They do not allow empty/nil fields
      expect(Comment.new(
        body: "b",
        user_id: @user.id,
        rating: 3
      )).not_to be_valid
    end

    it "incorrect rating type -> invalid" do
      # Factories don't work for this test -> They do not allow wrong types
      expect(Comment.new(
        body: "b",
        user_id: @user.id,
        product_id: @product.id,
        rating: "a"
      )).not_to be_valid
    end

  end
end
