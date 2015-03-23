class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to root_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def authorize
    if current_user
      unless current_user.id == params[:id].to_i
        redirect_to login_path, alert: "Denied access"
      end
    else
      redirect_to login_path, alert: "Denied access"
    end
  end

end
