class UsersController < ApplicationController

    before_action :authorize_user
    before_action :current_user, only: [:show, :edit, :update]
    skip_before_action :authorize_user, only: [:new, :create, :home, :update]


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

    def edit
        @user = current_user
    end

    def update
        user = current_user.update update_user_params
        if user
            redirect_to user_path(@user)
        else
            flash[:errors] = ["Update failed. Please check and try again"]
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :bio)
    end

    def update_user_params
        params.require(:user).permit(:id, :username, :password, :first_name, :last_name, :bio)
    end

end
