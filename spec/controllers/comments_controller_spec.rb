require 'rails_helper'

describe CommentsController, type: :controller do

  ########################################################
  # Test: Have different users destroy a comment
  ########################################################
  describe "destroy ->" do

    before(:each) do
      @user1 = FactoryBot.create(:random_user)
      @user2 = FactoryBot.create(:random_user)
      @admin = FactoryBot.create(:random_user, admin: true)
      @product = FactoryBot.create(:random_product)
    end

    context 'by guest user ->' do
      before(:each) do
        @comment = FactoryBot.create(:random_comment,
          user_id: @user1.id,
          product_id: @product.id
        )
      end

      it 'fail' do
        expect{
          @comment.destroy
        }.to change(Comment, :count).by(-1)
        expect(response).to be_ok
        # expect(response).to redirect_to product
      end
    end

    context 'by admin ->' do
      before(:each) do
        @comment = FactoryBot.create(:random_comment,
          user_id: @admin.id,
          product_id: @product.id
        )
      end

      it 'succeed' do
        sign_in @admin
        expect{ @comment.destroy }.to change(Comment, :count).by(-1)
        expect(response).to be_ok
      end
    end

  end
end
