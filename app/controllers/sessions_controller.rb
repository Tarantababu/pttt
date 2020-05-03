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
            flash.now[:alert] = "There is a problem"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logout Successfull"
        redirect_to root_path
    end
end