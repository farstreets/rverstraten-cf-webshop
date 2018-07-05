################################################################
# Validates from the model
################################################################
# validates :user, presence: true
# validates :product, presence: true
################################################################

require 'rails_helper'

describe Order do

  ########################################################
  # Order validation tests
  ########################################################
  context "validation ->" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "user1@gmail.com", password: "user1pw") }

    it "all good -> valid" do
      expect(Order.new(
        product_id: product.id,
        user_id: user.id
      )).to be_valid
    end

    it "no product id -> not valid" do
      expect(Order.new(
        user_id: user.id
      )).not_to be_valid
    end

    it "no user id -> not valid" do
      expect(Order.new(
        product_id: product.id,
      )).not_to be_valid
    end

  end
end
