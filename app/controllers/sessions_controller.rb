class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    # authenticate that user/pass combo is legit
     user = User.find_by(email: params[:email]) 

    if user && user.authenticate(params[:password]) 
      log_in(user)
      flash[:notice] = "You have successfully logged in. Welcome Back!" 
      redirect_to user_path(user) 
    else
       flash[:notice] = "Incorrect Login. Try again."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to(root_path)
  end
end