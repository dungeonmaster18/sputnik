class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_raven_context
    private
    
    def set_raven_context
      Raven.user_context(id: session[:current_user_id])
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end

    def logged_in?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def authenticate_user
      unless session[:user_id]
        redirect_to(:controller => 'sessions', :action => 'login')
        flash[:alert] = "Please login first"
        return false
      else
        # set current_user by the current user object
        @current_user = User.find(session[:user_id])
        return true
      end
    end

    def authenticate_admin
      unless session[:admin_id]
        redirect_to(:controller => 'admin_session', :action => 'login')
        flash[:alert] = "Please login first"
        return false
      else
        @current_user = Admin.find(session[:admin_id]) 
        return true
      end
    end
  
    #This method is for prevent user to access Signup & Login Page without logout
    def save_login_state
      if session[:user_id]
              redirect_to user_profile_path(session[:user_id]), notice: 'Already Logged in!'
        return false
      else
        return true
      end
    end

    helper_method :logged_in?
end