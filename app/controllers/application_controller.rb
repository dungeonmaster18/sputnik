class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private
    
    def logged_in?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def authenticate_user
      unless session[:user_id]
        redirect_to(:controller => 'sessions', :action => 'login')
        return false
      else
        # set current_user by the current user object
        @current_user = User.find session[:user_id] 
        return true
      end
    end
  
    #This method for prevent user to access Signup & Login Page without logout
    def save_login_state
      if session[:user_id]
              redirect_to(:controller => 'users', :action => 'home')
        return false
      else
        return true
      end
    end

    helper_method :logged_in?
end