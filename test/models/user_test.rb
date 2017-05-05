require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(first_name: "Valid fname", last_name: "Valid lname",
                              email: "valid@email.com", password: "password",
                              password_confirmation: "password")
  end
  
  test "should reject passwords that are too short or long" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "a" * 100
    assert_not @user.valid?
  end
  
  test "should reject missmatching password confirmation" do
    @user.password = "password"
    @user.password_confirmation = "passwurd"
    assert_not @user.valid?
  end
  
  test "Should reject first name if too short or long" do
    @user.first_name = ""
    assert_not @user.valid?
    @user.first_name = "a" * 50
    assert_not @user.valid?
  end
  
  test "Should reject last name if too short or long" do
    @user.last_name = ""
    assert_not @user.valid?
    @user.last_name = "a" * 50
    assert_not @user.valid?
  end
  
  test "Should reject invalid email addresses" do
    invalid_emails = ["@.com", "asd.com", "@",
                                    "example@asd-com", "asd.asd@example..com"]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?
      assert_equal ["is not a valid email"], @user.errors.messages[:email]
    end
  end
  
  test "Should accept valid email addresses" do
    valid_emails = ["valid@example.com", "asdas-asd@jacob.com", 
                          "ole@ole-ole.com", "ASDASD@ole.com"]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email} should be valid"
    end
  end
  
end
