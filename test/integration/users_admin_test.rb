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
end
