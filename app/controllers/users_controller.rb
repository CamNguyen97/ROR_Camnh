class UsersController < ApplicationController

  def show

    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "error"
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new users_params
    if @user.save
      flash[:success] = t "suscess"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit :email, :name, :password, :confirmation
  end

end
