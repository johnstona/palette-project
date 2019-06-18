class SessionsController < ApplicationController

  before_action :authorize_user
  skip_before_action :authorize_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    if !user || !user.authenticate(params[:password])
      flash[:errors] = ["Credentials aren't valid"]
      redirect_to login_path
    else
      session[:user_id] = user.id
      redirect_to new_palette_path(4)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end
