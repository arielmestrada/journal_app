require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    setup do
        @test_category = categories(:category_one)
    end

    test "should get category index" do 
        get categories_path
        assert_response :success
    end    

    test "should show category" do
        get category_path(@test_category.id)
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

    test "should be unprocessable entity if category not saved" do
        assert_difference("Category.count", 0) do            
            post categories_path, params: { category: { name: "" } }
            assert_response :unprocessable_entity
        end
    end  
    
    test "should get edit category" do
        get edit_category_path(@test_category.id)
        assert_response :success
    end

    test "should update category" do
        patch category_path(@test_category.id), params: { category: { name: "Edited Name" } }

        @test_category.reload

        assert_equal "Edited Name", @test_category.name
    end

    test "should be unprocessable entity if category not edited" do
        assert_difference("Category.count", 0) do            
            patch category_path(@test_category.id), params: { category: { name: "" } }
            assert_response :unprocessable_entity
        end
    end 

    test "should delete a category" do
        assert_difference("Category.count", -1) do            
            delete category_path(@test_category.id)
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end        
end























