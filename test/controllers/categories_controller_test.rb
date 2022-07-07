require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should show category" do
        get categories_path(1)
        assert_response :success
    end

    test "should create a category" do
        post categories_path
        assert_response :success
    end

end























