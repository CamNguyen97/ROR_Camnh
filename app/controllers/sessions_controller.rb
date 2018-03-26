class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == Settings.session_member ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash[:danger] = t "sessions.new.danger"
      render :new
    end
  end

  def destroy
    log_out if log_in?
    redirect_to root_path
  end

end
