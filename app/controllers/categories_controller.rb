class CategoriesController < ApplicationController

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end

    def show
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category created Successfully"
            redirect_to categories_path
        else
            render 'new'
        end
    end
    
    def update
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
    
    
end