require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should not save user without options" do
    user = User.new
    assert_not user.save
  end
end
