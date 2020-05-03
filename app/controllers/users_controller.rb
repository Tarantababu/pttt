class UsersController < ApplicationController
    before_action :set_user, only: [:update, :edit, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]
    
    def show
        @pieces = @user.pieces.paginate(page: params[:page], per_page: 9)
    end
    
    def index
       @users = User.paginate(page: params[:page], per_page: 9)
        
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to the PTTT, #{@user.username}"
            redirect_to pieces_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information has been updated successfully."
            redirect_to pieces_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @user.destroy
        flash[:danger] = "User and pieces/categories belongs to this user has been deleted successfully "
        redirect_to users_path
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You can only edit your own account (:"
            redirect_to root_path
        end
    end
    
    def require_admin
        if !logged_in? and !current_user.admin?
            flash[:danger] = "Only Admin Users can perform this action (:"
            redirect_to root_path
        end
    end
end