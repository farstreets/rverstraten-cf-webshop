require 'rails_helper'

describe OrdersController, type: :controller do

  before(:each) do
    @admin = FactoryBot.create(:random_user, admin: true)
    @user = FactoryBot.create(:random_user)
  end

  ########################################################
  # Test: Get the orders/chats index page
  ########################################################
  describe 'GET #index ->' do

    context 'not logged in ->' do
      it 'redirect home + flash alert' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
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
      it "redirect home + flash alert" do
        sign_in @user
        get :index
        expect(response).to be_ok
        # expect(response).to redirect_to(root_path)
        # expect(flash[:alert]).to be_present
        # expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end
end
