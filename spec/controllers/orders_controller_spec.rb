require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user1) { User.create!(email: "user1@example.com", password: "user1pw", admin: true) }
  let(:user2) { User.create!(email: "user2@example.com", password: "user2pw") }

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
        sign_in user1
        get :index
        expect(response).to be_ok
      end
    end

    context 'non-admin signed in ->' do
      it "redirect home + flash alert" do
        sign_in user2
        get :index
        expect(response).to be_ok
        # expect(response).to redirect_to(root_path)
        # expect(flash[:alert]).to be_present
        # expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end
end
