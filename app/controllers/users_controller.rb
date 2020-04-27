class UsersController < ApplicationController
    
    def index
    end
    
    def show
        @user = User.find(params[:id])
        @pieces = @user.pieces
    end
    
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            flash[:notice] = "Welcome to the PTTT, #{@user.username}"
            redirect_to pieces_path
        else
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account information was successfully updated."
            redirect_to pieces_path
        else
            render 'edit'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end