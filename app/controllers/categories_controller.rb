class CategoriesController < ApplicationController
    def index
        
    end

    def show

    end

    def create
        @category = Category.new(category_params)

        if @category.save
            render json: @category.to_json
        else
            redirect_to :new
        end

    end

    def new
        
    end

    private

    def category_params
        params.permit(:name)
    end
end 