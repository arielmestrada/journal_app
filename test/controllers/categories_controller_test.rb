require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

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
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end   
    
    test "should get edit category" do
        get edit_category_path(Category.first.id)
        assert_response :success
    end

    test "should update category" do
        @category = Category.create(name: "Some Category")

        patch category_path(@category.id), params: { category: { name: "Edited Name" } }

        @category.reload

        assert_equal "Edited Name", @category.name
    end

    test "should delete a category" do
        @category = Category.first

        assert_difference("Category.count", -1) do            
            delete category_path(@category.id)
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end        
end























