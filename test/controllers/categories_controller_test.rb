require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
=begin
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
=end

    test "should get category index" do 
        get categories_path
        assert_response :success
    end    

    test "should show category" do
        @category = Category.create(name: "Some Category")
        get category_path(@category.id)
        assert_response :success
    end

    test "should get new" do
        get new_category_path
        assert_response :success
    end

    test "should create a category" do

        assert_difference("Category.count", 1) do            
            post categories_path, params: { category: { name: "Test" } }
        end
        
    end    
    
end























