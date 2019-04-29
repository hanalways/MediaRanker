require "test_helper"

describe UsersController do
  let(:sample_user) { users(:one) }

  describe "login_form" do 
    it "can get the login page" do 
      get login_path

      must_respond_with :success
    end
  end

  describe "login" do 
    it "will login a returning user" do 
      user_data = {
        user: {
          username: user.username,
        },
      }

      expect {
        post login_path, params: user_data
      }.wont_change "User.count"
    end
  end

end
