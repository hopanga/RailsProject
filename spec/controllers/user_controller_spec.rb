require 'rails_helper'

  describe UsersController, :type => :controller do

    before do
      @user = User.create!(email: "test8@gmail.com", password: "testtest1")
    end

    describe "GET #show" do
      context "User is logged in" do
          before do
            sign_in @user
          end

          it "Displays user details" do
              get :show, id: @user.id
              expect(response).to have_http_status(200)
              expect(assigns(:user)).to eq @user
          end
      end

      context "No user is logged in" do
          it "redirects to login" do
            get :show, id: @user.id
            expect(response).to redirect_to(new_user_session_path)
          end
      end

      before do
        @user2 = User.create!(email: "test9@gmail.com", password: "testtest1")
      end

      context "User cannot access other users page" do
          before do
            sign_in @user2
          end

          it "redirects user to index" do
            get :edit, id: @user.id
            expect(response).to redirect_to(root_path)
          end

          it "responds with HTTP 302 redirect" do
            get :edit, id: @user.id
            expect(response).to have_http_status(302)
          end
      end
  end
end