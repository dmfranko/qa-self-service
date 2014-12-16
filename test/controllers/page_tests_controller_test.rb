require 'test_helper'

class PageTestsControllerTest < ActionController::TestCase
  test "should not save page without options" do
    page = Page.new
    assert_not post.save
  end
end
