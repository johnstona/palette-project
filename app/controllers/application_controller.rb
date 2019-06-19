class ApplicationController < ActionController::Base

    before_action :current_user
    helper_method :current_user, :logged_in?, :authorize_user

    def current_user
      @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    def logged_in?
        current_user.id != nil
    end

    def authorize_user
        if !logged_in?
            flash[:errors] = ["You must be logged in to view that page"]
            return redirect_to login_path
        end
    end

end
