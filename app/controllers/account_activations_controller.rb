class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by email: params[:email]
    debugger
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t "account_activation"
      redirect_to user
    else
      flash[:danger] = t "account.edit.danger"
      redirect_to root_url
    end
  end

end
