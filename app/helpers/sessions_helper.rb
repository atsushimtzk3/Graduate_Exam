module SessionsHelper
    
  def now_user
    @now_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    now_user.present?
  end
  
end
