class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.update_attributes(admin: false)
    if @user.save
      flash[:notice] = "Thanks for signing up #{@user.fname}!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "There were some problems with your submission."
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user && @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Your account was deleted successfully."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem deleting your account."
      redirect_to :back
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :email_confirmation, :password, :password_confirmation, :fname)
  end

end
