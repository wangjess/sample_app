require 'test_helper'

class UsersAdminTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:michael)
    @not_admin = users(:archer)
    @scammer = users(:fake_grill)
  end

  test "am an admin" do
    log_in_as(@admin)
  end

  test "not an admin" do
    log_in_as(@not_admin)
  end

  test "admins can view and edit other people" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    get users_path(@not_admin)
    assert_response :success
  end

  test "non-admins can't view or edit other people" do
    log_in_as(@not_admin)
    get users_path(@not_admin)
    follow_redirect!
    assert_template '/'
    get users_path
    follow_redirect!
    assert_template '/'
  end

  test "admins can see the wistia form" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    get users_path(@not_admin)
    assert_response :success
    assert_select "form", true
  end

  test "non-admins can't see the wistia form" do
    log_in_as(@not_admin)
    get users_path(@not_admin)
    follow_redirect!
    assert_response :success
    assert_select "form", false, "This page must contain no forms"
  end

  test "admins successfully updates wistia form" do
    log_in_as(@admin)
    get users_path(@scammer)
    # TODO assert that i can update scammer's project
  end
end
