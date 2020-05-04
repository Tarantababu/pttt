class CategoriesController < ApplicationController
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy, :show]

    def index
        @categories = current_user.categories.paginate(page: params[:page], per_page: 5)
    end

    def show
        @category = Category.find(params[:id])
        @category_pieces = @category.pieces.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        @category.user = current_user
        if @category.save
            flash[:notice] = "Category has been created successfully"
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
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        flash[:notice] = "Category has been deleted successfully."
        redirect_to categories_path
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
    
    def require_same_user
        @category = Category.find(params[:id])
        if current_user != @category.user && !current_user.admin?
            flash[:danger] = "You can only control your own categories."
            redirect_to root_path
        end
    end
    
end