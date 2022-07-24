require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        @user = users(:user_one)
    end

    test "user sign out redirect to sign in" do
        sign_in @user
        delete destroy_user_session_path
        assert_response :redirect
        follow_redirect!
        assert_equal "/users/sign_in", request.path
    end
end