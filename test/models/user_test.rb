require "test_helper"

describe User do
  describe "validations" do 
    let(:user) { User.create!(
      username: "test username"
      )
    }

    it "is valid when username is present and unique" do 
      is_valid = user.valid?
      expect(is_valid).must_equal true
    end

    it "is invalid without a username" do 
      user.username = nil
      expect(user.valid?).must_equal false
    end

    it "is invalid if username is non-unique" do 
      user.username = User.first.username

      expect(user.valid?).must_equal false
      expect(user.errors.messages).must_include :username
    end 
  end
end
