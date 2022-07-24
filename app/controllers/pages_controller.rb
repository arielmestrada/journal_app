class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_tasks

    def index        
    end

    def destroy
    end

    private

    def get_tasks 
        @date = Date.today.to_s
        @user_id = User.find(current_user.id)
        @category = @user_id.categories
        @tasks_today = []
        @category.each do |category|
            category.tasks.each do |task|
                if task.deadline.to_s.include?(@date)
                    @deadline = task.deadline.to_s
                    @trimmed_deadline = @deadline[0..9]
                    @task = {
                        'name' => task.name, 
                        'description' => task.description,
                        'deadline' => @trimmed_deadline,
                        'category_id' => task.category_id,
                        'task_id' => task.id
                    }
                    @tasks_today << @task
                end
            end
        end
    end

end