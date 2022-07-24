require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in users(:user_one)
        @category = categories(:category_one)
    end
    
    test "should get categories_path (categories#index)" do 
        get categories_path
        assert_response :success
    end    

    test "should get category_path (categories#show)" do
        get category_path(@category.id)
        assert_response :success
    end    

    test "should get new_category_path (categories#new)" do
        get new_category_path
        assert_response :success
    end

    test "should post categories_path (categories#create) & increase category count by 1" do
        assert_difference("Category.count", 1) do            
            post categories_path, params: { category: { name: "Test" } }
            assert_response :redirect
        end
        
        follow_redirect!
        assert_equal "/categories", request.path
    end   

    test "should be unprocessable entity if category not saved" do
        assert_difference("Category.count", 0) do            
            post categories_path, params: { category: { name: "" } }
            assert_response :unprocessable_entity
        end
    end  
    
    test "should get edit_category_path (categories#edit)" do
        get edit_category_path(@category.id)
        assert_response :success
    end

    test "should patch /category_path (categories#update)" do
        patch category_path(@category.id), params: { category: { name: "Edited Name" } }

        @category.reload

        assert_equal "Edited Name", @category.name
    end

    test "should be unprocessable entity if category not edited" do
        patch category_path(@category.id), params: { category: { name: "" } }
        assert_response :unprocessable_entity
    end 

    test "should delete /category_path (categories#destroy)" do
        assert_difference("Category.count", -1) do            
            delete category_path(@category.id)
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end   
end























