require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path # access the signup page
    assert_no_difference 'User.count' do # test User.count before and after the post method
      post users_path, params: { # test a form submit
        user: {
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end
    assert_template 'users/new'
  end
end
