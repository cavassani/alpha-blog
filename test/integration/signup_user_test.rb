require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest

  test "sign up user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username:"mama", email: "teste@emailloco.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "mama", response.body
  end
  
end
