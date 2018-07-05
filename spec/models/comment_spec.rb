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
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "user1@gmail.com", password: "user1pw") }

    it "all good -> valid" do
      expect(Comment.new(
        body: "b",
        user_id: user.id,
        product_id: product.id,
        rating: 3
      )).to be_valid
    end

    it "no rating -> invalid" do
      expect(Comment.new(
        body: "b",
        user_id: user.id,
        product_id: product.id
      )).not_to be_valid
    end

    it "no body -> invalid" do
      expect(Comment.new(
        user_id: user.id,
        product_id: product.id,
        rating: 3
      )).not_to be_valid
    end

    it "no user_id -> invalid" do
      expect(Comment.new(
        body: "b",
        product_id: product.id,
        rating: 3
      )).not_to be_valid
    end

    it "no product_id -> invalid" do
      expect(Comment.new(
        body: "b",
        user_id: user.id,
        rating: 3
      )).not_to be_valid
    end

    it "incorrect rating type -> invalid" do
      expect(Comment.new(
        body: "b",
        user_id: user.id,
        product_id: product.id,
        rating: "a"
      )).not_to be_valid
    end

  end
end
