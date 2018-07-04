require 'rails_helper'

describe Product do

  ########################################################
  # Product name tests
  ########################################################
  context "name ->" do
    let(:product) { Product.create!(name: "race bike") }

    it "equal to" do
      expect(product.name).to eq "race bike"
    end

    it "not equal to" do
      expect(product.name).to_not eq "racebike"
    end

    it "missing -> product not valid" do
      expect(Product.new(description: "Nice bike")).to_not be_valid
    end
  end

  ########################################################
  # Product no-name tests
  ########################################################
  context "no-name ->" do
    let(:product) { Product.new(description: "Nice bike") }

    it "product not valid" do
      expect(product).to_not be_valid
    end
  end

  ########################################################
  # Product comments average rating tests
  ########################################################
  context "comments average rating ->" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "user1@gmail.com", password: "user1pw") }
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "equal to" do
      expect(product.average_rating).to eq 3
    end

    it "not equal to" do
      expect(product.average_rating).to_not eq 4
    end
  end

end
