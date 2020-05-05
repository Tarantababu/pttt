class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "You've logged in successfully."
            redirect_to pieces_path
        else
            flash.now[:alert] = "Wrong Pass or Username. Please check your credentials again."
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You've logged out successfully"
        redirect_to root_path
    end
end