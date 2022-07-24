require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
        sign_in users(:user_one)
        @task = tasks(:one)
    end    

    test "should get task index" do
        get category_tasks_path(@task.category_id)
        assert_response :success
    end

    test "should show task" do        
        get category_task_path(@task.category_id, @task.id)
        assert_response :success
    end

    test "should get task new" do
        get new_category_task_path(@task.category_id)
        assert_response :success
    end

    test "should create a task" do        
        assert_difference("Task.count", 1) do            
            post category_tasks_path(@task.category_id), params: { task: { name: "Test Name", description: "Test Desc", deadline: "2022-07-27 00:00:00", id: @task.category_id } }
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end   

    test "should be unprocessable entity if task not saved" do
        assert_difference("Task.count", 0) do            
            post category_tasks_path(@task.category_id), params: { task: { name: "", id: @task.category_id } }
            assert_response :unprocessable_entity
        end       
    end
    
    test "should get edit task" do
        get edit_category_task_path(@task.category_id, @task.id)
        assert_response :success
    end

    test "should update task" do
        patch category_task_path(@task.category_id, @task.id), params: { task: { name: "Test Name", description: "Test Desc", deadline: "2022-07-27 00:00:00", category_id: @task.category_id } }

        @task.reload

        assert_equal "Test Name",  @task.name
    end

    test "should be unprocessable entity if task not edited" do
        
        assert_difference("Task.count", 0) do            
            patch category_task_path(@task.category_id, @task.id), params: { task: { name: "", description: "", deadline: "", category_id: @task.category_id} }
            assert_response :unprocessable_entity
        end       
    end

    test "should delete a task" do
        assert_difference("Task.count", -1) do            
            delete category_task_path(@task.category_id, @task.id)
            assert_response :redirect
        end
        
        follow_redirect!
        assert_response :success
    end

    test "task on home page" do
        get root_path
        assert_response :success        
    end
end