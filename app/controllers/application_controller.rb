class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :authorize_user

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        current_user != nil
    end

    def authorize_user
        if !logged_in?
            flash[:notice] = ["You must be logged in to view that page"]
            return redirect_to login_path
        end
    end

end
