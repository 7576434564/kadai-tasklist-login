module SessionsHelper
  def current_user
    @current_user ||= Taskuser.find_by(id: session[:taskuser_id])
  end

  def logged_in?
    !!current_user
  end
end
