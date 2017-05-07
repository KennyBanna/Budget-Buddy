class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate( params[:session][:password] )
      # LOG IN
      session[:user_id] = user.id
      redirect_to user
    else
      # Re render log in page
      render :new
    end
  end
  
  def destroy
  end

end