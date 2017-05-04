require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(first_name: "Valid fname", last_name: "Valid lname",
                              email: "valid@email.com", password: "password",
                              password_confirmation: "password")
  end
  
  test "Should reject invalid email addresses" do
    invalid_emails = ["@.com", "asd.com", "@",
                                    "example@asd-com", "asd.asd@example..com"]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?
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
