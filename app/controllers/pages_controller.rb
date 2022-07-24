class PagesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_tasks

    private

    def get_tasks 
        @date = Date.today.to_s
        @category = User.find(current_user.id).categories
        @tasks_today = []
        @category.each do |category|
            category.tasks.each do |task|
                @tasks_today.push(task) if task.deadline.to_s.include?(@date)
            end
        end
    end

end