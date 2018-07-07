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
      expect(Product.new(name: "Nice bike")).to be_valid
    end

    it "no name -> not valid" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end

  ########################################################
  # Product name tests
  ########################################################
  context "name ->" do
    let(:product) { Product.create!(name: "race bike") }

    it "equal to" do
      expect(product.name).to eq "race bike"
    end

    it "not equal to" do
      expect(product.name).not_to eq "racebike"
    end
  end

  ########################################################
  # Product average rating tests
  ########################################################
  context "average rating ->" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "user1@gmail.com", password: "user1pw") }
    before(:each) do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "equal to" do
      expect(product.average_rating).to eq 3
    end

    it "not equal to" do
      expect(product.average_rating).not_to eq 4
    end

  end
end
