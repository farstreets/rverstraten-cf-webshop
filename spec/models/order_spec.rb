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
    before(:each) do
      @product = FactoryBot.create(:random_product)
      @user = FactoryBot.create(:random_user)
    end

    it "all good -> valid" do
      @order = FactoryBot.create(:random_comment,
        user_id: @user.id,
        product_id: @product.id
      )
      expect(@order).to be_valid
    end

    it "no product id -> not valid" do
      # Factories don't work for this test -> They do not allow empty/nil fields
      expect(Order.new(
        user_id: @user.id
      )).not_to be_valid
    end

    it "no user id -> not valid" do
      # Factories don't work for this test -> They do not allow empty/nil fields
      expect(Order.new(
        product_id: @product.id,
      )).not_to be_valid
    end

  end
end
