class UsersController < ApplicationController
    before_action :set_user, only: [:update, :edit, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]
    
    def show
        @pieces = @user.pieces.paginate(page: params[:page], per_page: 5)
    end
    
    def index
       @users = User.paginate(page: params[:page], per_page: 5)
        
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
            flash[:notice] = "Your account information was successfully updated."
            redirect_to pieces_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @user.destroy
        flash[:danger] = "User and pieces belongs to this user was successfully deleted"
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
            flash[:danger] = " :D You can only edit your own account"
            redirect_to root_path
        end
    end
    
    def require_admin
        if !logged_in? and !current_user.admin?
            flash[:danger] = " :D Only Admin Users can perform this action"
            redirect_to root_path
        end
    end
end