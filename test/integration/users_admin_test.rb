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

  test "admins can see the wistia project box" do
    log_in_as(@admin)
    get users_path(@not_admin)
    assert_response :success
      post_via_redirect "/signup",
                        :wistia_project_id => '**?_NEW_SCAMMER-PROJECT_!'
    end
    # TODO assert she can see form
  end

  test "non-admins can't see the wistia project box" do
    log_in_as(@not_admin)
    get users_path(@scammer)
    # TODO assert she can't see form
  end

  test "admins can update project ids" do
    log_in_as(@admin)
    get users_path(@scammer)

  end

  test "non-admins can't update project ids" do
    log_in_as(@not_admin)
    get users_path(@scammer)
  end
end
