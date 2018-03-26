class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
     @users = User.where(activated: FILL_IN).paginate page: params[:page],
      :per_page => 5
  end

  def show
    @user = User.find_by id: params[:id]
    return t "error" if @user
    redirect_to root_url and return unless FILL_IN
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new users_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "info"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find_by id: params[:id]
     return t"error" if @user
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "suscess"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id]).destroy
    if @user.destroy
      flash[:success] = t"user_deleted"
      redirect_to users_url
    end
      t"error"
  end

  def logged_in_user
    unless log_in?
      store_location
      flash[:danger] = t"danger"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end

  private
  def users_params
    params.require(:user).permit :email, :name, :password, :password_digest
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

end
