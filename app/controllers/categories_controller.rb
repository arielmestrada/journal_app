class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_user_id

    def index
        @categories = @user_id.categories
    end

    def show
        @category = @user_id.categories.find(params[:id])
    end

    def new
        @category = @user_id.categories.new        
    end

    def create
        @category = @user_id.categories.new(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @category = @user_id.categories.find(params[:id])
    end

    def update
        @category = @user_id.categories.find(params[:id])

        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = @user_id.categories.find(params[:id])
        @category.destroy
        flash[:alert] = "Category has been deleted"
        redirect_to categories_path, status: :see_other
    end

    private

    def get_user_id
        @user_id = User.find(current_user.id)
    end

    def category_params
        params.require(:category).permit(:name)
    end
end 