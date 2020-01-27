require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    admin = create(:admin)
    sign_in_as admin
  end

  test "should get show" do
    user = create(:user)
    get admin_user_url(user)
    assert_response :success
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get edit" do
    user = create(:user)
    get edit_admin_user_url(user)
    assert_response :success
  end

  test "should get new" do
    get new_admin_user_url
    assert_response :success
  end

  test "should get create" do
    user = attributes_for(:user)
    post admin_users_url, params: { user: user }
    assert_response :redirect
  end
end
