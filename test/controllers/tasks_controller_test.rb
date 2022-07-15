require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
    test "should get task index" do
        get category_tasks_path(Category.last.id)
        assert_response :success
    end

    test "should show task" do
        get category_task_path(category_id: Category.last.id, id: Task.last.id)
        assert_response :success
    end

    test "should get task new" do
        @category = Category.create(name: "Test Category")
        get new_category_task_path(@category.id)
        assert_response :success
    end

    test "should create a task" do
        
        assert_difference("Task.count", 1) do            
            post category_tasks_path(Category.last.id), params: { task: { name: "Edited Name", id: Category.last.id} }
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end   
    
    test "should get edit task" do
    end

    test "should update task" do
    end

    test "should delete a task" do
    end
end