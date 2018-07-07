require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) { Product.create!(name: "race bike") }
  let(:user1) { User.create!(email: "user1@example.com", password: "user1pw", admin: true) }
  let(:user2) { User.create!(email: "user2@example.com", password: "user2pw") }

  ########################################################
  # Test: Get the products INDEX page
  ########################################################
  describe 'GET #index ->' do

    context 'not logged in ->' do
      it 'all good' do
        get :index
        expect(response).to be_ok
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in user1
        get :index
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in user2
        get :index
        expect(response).to be_ok
      end
    end

  end

  ########################################################
  # Test: Get the products SHOW page
  ########################################################
  describe 'GET #show ->' do

    context 'not logged in ->' do
      it 'redirect to login' do
        get :show, params: { id: product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in user1
        get :show, params: { id: product.id }
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in user2
        get :show, params: { id: product.id }
        expect(response).to be_ok
      end
    end

  end

  ########################################################
  # Test: Get the products EDIT page
  ########################################################
  describe 'GET #show ->' do

    context 'not logged in ->' do
      it 'redirect to login' do
        get :edit, params: { id: product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in user1
        get :edit, params: { id: product.id }
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in user2
        get :edit, params: { id: product.id }
        expect(response).to be_ok
        # expect(response).to redirect_to(root_path)
        # expect(flash[:alert]).to be_present
        # expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end

  ########################################################
  # Test: DESTROY product
  ########################################################
  describe 'DESTROY product ->' do

    context 'not logged in ->' do
      it 'redirect to login' do
        delete :destroy, params: { id: product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in user1
        delete :destroy, params: { id: product.id }
        expect(response.body).to have_content("You are being redirected.")
        # expect(response.body).to have_content("Are you sure?")
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in user2
        delete :destroy, params: { id: product.id }
        expect(response.body).to have_content("You are being redirected.")
        # expect(response).to redirect_to(root_path)
        # expect(flash[:alert]).to be_present
        # expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end

end
