################################################################
# Validates from the model
################################################################
# validates :name, presence: true
################################################################

require 'rails_helper'

describe Product do

  ########################################################
  # Product validation tests
  ########################################################
  context "validation ->" do

    it "all good -> valid" do
      @product = FactoryBot.build(:random_product, description: nil)
      expect(@product).to be_valid
    end

    it "no name -> not valid" do
      # Cannot be done with factory -> active record does not allow nameless products
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

  end

  ########################################################
  # Product name tests
  ########################################################
  context "name ->" do

    before(:each) do
      @product = FactoryBot.build(:random_product, name: "race bike")
    end

    it "equal to" do
      expect(@product.name).to eq "race bike"
    end

    it "not equal to" do
      expect(@product.name).not_to eq "racebike"
    end

  end

  ########################################################
  # Product average rating tests
  ########################################################
  context "average rating ->" do
    before(:each) do
      @user = FactoryBot.create(:random_user)
      @product = FactoryBot.create(:random_product)
    end

    before(:each) do
      @product.comments.create!(rating: 1, user_id: @user.id, body: "Awful bike!")
      @product.comments.create!(rating: 3, user_id: @user.id, body: "Ok bike!")
      @product.comments.create!(rating: 5, user_id: @user.id, body: "Great bike!")
    end

    it "equal to" do
      expect(@product.average_rating).to eq 3
    end

    it "not equal to" do
      expect(@product.average_rating).not_to eq 4
    end

  end
end
