class UsersController < ApplicationController
    before_action :set_user, only: [:update, :edit, :show]
    
    def show
        @pieces = @user.pieces.paginate(page: params[:page], per_page: 2)
    end
    
    def index
       @users = User.paginate(page: params[:page], per_page: 2)
        
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
        flash[:danger] = "User was successfully deleted"
        redirect_to pieces_path
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
end