class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t "register_success"
      redirect_to root_path
    else
      flash[:success] = t "register_failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name,
      :email, :password, :password_confirmations, :address, :phone
  end
end
