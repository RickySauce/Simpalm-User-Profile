require 'rmagick'

class UsersController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]
  before_action :require_logged_in, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user
      render :show
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if @user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:message] = "Successfully Updated Profile"
      render :edit
    end
  end

  private

  def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :dob,
        :email,
        :password,
        :password_confirmation,
        :avatar
      )
    end

end
