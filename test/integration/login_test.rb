require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:oskar)
  end
  
  test "Should successfully login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email,
                                     password: "password" } }
    assert_equal session[:user_id], @user.id
    assert_redirected_to @user
  end
  
  test "Should redirect failed login" do
    get login_path  
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email,
                                     password: "" } }
    assert_template 'sessions/new'
  end
  
  
end
