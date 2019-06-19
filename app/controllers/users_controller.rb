class UsersController < ApplicationController

    before_action :authorize_user
    before_action :current_user, only: [:show]
    skip_before_action :authorize_user, only: [:new, :create, :home]


    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user.valid?
            flash[:errors] =["Account successfully created. Please log in"]
            redirect_to login_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
      user = User.find(params[:id])
      @username = user.username
      @user_palette = user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :bio)
    end

end
