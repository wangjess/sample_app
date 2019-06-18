require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path, count: 0
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", contact_path, count: 1
    get contact_path
    assert_select "title", full_title("Contact")
  end

  test "proper behavior for non-admin logged-in users" do
    get root_path
    log_in_as(@other_user)
    get contact_path
    assert_select "title", full_title("Contact")
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path, count: 1
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", contact_path, count: 1
  end

  test "proper behavior for admin logged-in users" do
    get root_path
    log_in_as(@user)
    get contact_path
    assert_select "title", full_title("Contact")
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", help_path, count: 0
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", contact_path, count: 1
    assert_select "a[href=?]", users_path, count: 1
  end
end