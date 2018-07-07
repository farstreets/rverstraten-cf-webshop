require 'rails_helper'

describe UsersController, type: :controller do
  let(:user1) { User.create!(email: "user1@example.com", password: "user1pw") }
  let(:user2) { User.create!(email: "user2@example.com", password: "user2pw") }

  ########################################################
  # Test: Get the show user page
  ########################################################
  describe 'GET #show ->' do

    context 'not logged in ->' do
      it 'redirect home + flash alert' do
        get :show, params: { id: user1.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
        expect(flash[:alert]).to match("You are not authorized to access this page.")
        # expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'logged in -> get own user page ->' do
      before(:each) do
        sign_in user1
      end
      it 'loads correct user details' do
        get :show, params: { id: user1.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user1
      end
    end

    context 'logged in -> try to get other users page ->' do
      before(:each) do
        sign_in user2
      end
      it 'redirect home + flash alert' do
        get :show, params: { id: user1.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
        expect(flash[:alert]).to match("You are not authorized to access this page.")
      end
    end

  end
end
