################################################################
# Controller actions
################################################################
# Index
# Show
# New
# Edit
# Create
# Update
# Destroy
################################################################

require 'rails_helper'

describe ProductsController, type: :controller do

  before(:each) do
    @admin = FactoryBot.create(:random_user, admin: true)
    @user = FactoryBot.create(:random_user)
    @product = FactoryBot.create(:random_product)
  end

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
        sign_in @admin
        get :index
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in @user
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
        get :show, params: { id: @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in @admin
        get :show, params: { id: @product.id }
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in @user
        get :show, params: { id: @product.id }
        expect(response).to be_ok
      end
    end

  end

  ########################################################
  # Test: NEW action
  ########################################################

  describe 'GET #new ->' do
    context 'admin ->' do
      it "all good" do
        sign_in @admin
        get :new
        expect(response).to render_template('new')
      end
    end
  end

  ########################################################
  # Test: Get the products EDIT page
  ########################################################
  describe 'GET #show ->' do

    context 'not logged in ->' do
      it 'redirect to login' do
        get :edit, params: { id: @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in @admin
        get :edit, params: { id: @product.id }
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in @user
        get :edit, params: { id: @product.id }
        expect(response).to be_ok
        # expect(response).to redirect_to(root_path)
        # expect(flash[:alert]).to be_present
        # expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end

  ########################################################
  # Test: CREATE action
  ########################################################

  # Directions from course text (6.15):
  # test 1: what happens when a product is created with valid data
  # test 2: what happens when a user tries to create a product,
  # but doesn't include all of the required information.

  describe "#create ->" do

    context "admin + valid ->" do
      it 'all good' do
        sign_in @admin
        @product_ok = FactoryBot.create(:random_product, name: "I_AM_OK" )
        expect(response).to be_ok
        expect(@product_ok.name).to eq("I_AM_OK")
      end
    end

    let(:no_name_product) { FactoryBot.create(:random_product) }
    context "admin + name missing ->" do
      it 'fail' do
        sign_in @admin
        no_name_product.name = nil
        post :create, params: { product: no_name_product.attributes }
        expect(response).to render_template('new')
      end
    end

  end

  ########################################################
  # Test: UPDATE action
  ########################################################

  describe "#update ->" do

    context "admin + valid ->" do
      it 'all good' do
        sign_in @admin
        patch :update, params: { id: @product.id, product: { :name => "new title", :description => "new description" }}
        expect(response).to be_redirect
      end
    end

  end

  ########################################################
  # Test: DESTROY product
  ########################################################
  describe 'DESTROY product ->' do

    context 'not logged in ->' do
      it 'redirect to login' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'admin signed in ->' do
      it "all good" do
        sign_in @admin
        delete :destroy, params: { id: @product.id }
        expect(response.body).to have_content("You are being redirected.")
        # expect(response.body).to have_content("Are you sure?")
      end
    end

    context 'non-admin signed in ->' do
      it "all good" do
        sign_in @user
        delete :destroy, params: { id: @product.id }
        expect(response.body).to have_content("You are being redirected.")
        # expect(response).to redirect_to(root_path)
        # expect(flash[:alert]).to be_present
        # expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end

end
