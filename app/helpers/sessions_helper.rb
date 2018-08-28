module SessionsHelper
    
  def now_user
    @now_user ||= User.find_by(id: session[:user_id])
  end
  

  
end
