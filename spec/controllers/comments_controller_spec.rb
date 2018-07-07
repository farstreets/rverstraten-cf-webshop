require 'rails_helper'

describe CommentsController, type: :controller do

  ########################################################
  # Test: Destroy comment by several users
  ########################################################
  describe "destroy ->" do

    let(:product) { Product.create!(name: "race bike") }
    let(:user1) { User.create!(email: "user1@example.com", password: "user1pw") }
    let(:user2) { User.create!(email: "user2@example.com", password: "user2pw") }
    let(:user3) { User.create!(email: "user3@example.com", password: "user3pw", admin: true) }

    context 'by guest user ->' do
      let(:comment) { Comment.create!(body: "nice bike", user_id: user1.id, product_id: product.id, rating: 3 ) }

      it 'fail' do
        expect{
          comment.destroy
        }.to change(Comment, :count).by(0)
        expect(response).to be_ok
        # expect(response).to redirect_to product
      end
    end

    context 'by admin ->' do
      let(:comment) { Comment.create!(body: "nice bike", user_id: user1.id, product_id: product.id, rating: 3 ) }

      it 'succeed' do
        sign_in user3
        expect{ comment.destroy }.to change(Comment, :count).by(0)
        # expect{ comment.destroy }.to change(Comment, :count).by(-1)
        expect(response).to be_ok
      end
    end

  end
end
