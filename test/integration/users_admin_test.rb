require 'test_helper'

class UsersAdminTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:michael)
    @not_admin = users(:archer)
  end

  test "am an admin" do
    log_in_as(@admin)
  end

  test "not an admin" do
    log_in_as(@not_admin)
  end

  test "admins can view and edit other people" do
    log_in_as(@admin)
    get users_path(@not_admin)
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
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
end
