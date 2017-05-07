module SessionsHelper
 
  def current_user
    User.find(session[:user_id])
  end
  
  def is_logged_in?
    !current_user.nil?
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
end