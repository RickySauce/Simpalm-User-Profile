
class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params["login"]["email"])
    if !@user || !@user.authenticate(params["login"]["password"])
      flash[:message] = "Incorrect Email Address or Password"
      render :new
    else
      session[:user_id] = @user.id
      flash[:message] = "Successfully Signed In!"
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:message] = "Successfully Logged out!"
    redirect_to root_path
  end

end
