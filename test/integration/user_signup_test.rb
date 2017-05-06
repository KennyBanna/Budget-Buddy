require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  def setup

  end
  
  test "invalid user signup should be redirected" do
    get signup_path
    assert_template "users/new"
    assert_no_difference "User.count" do
      post signup_path, params: { user: { first_name: "", 
                                          last_name: "",
                                          email: "asd",
                                          password: "asd",
                                          password_confirmation: "Haba" } }
    end
    assert_template "users/new"
  end
  
  test "Valid sign up" do
    get signup_path
    assert_template "users/new"
    assert_difference "User.count", 1 do
      post signup_path, params: { user: { first_name: "Valid", 
                                          last_name: "Validson",
                                          email: "valid@example.com", 
                                          password: "password",
                                          password_confirmation: "password" } }
    end
    user = assigns(:user)
    assert_redirected_to user_path(user)
  end
  
end
