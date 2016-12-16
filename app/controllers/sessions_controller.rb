class SessionsController < ApplicationController
  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_url, notice: t(:logged_in)
    else
      flash.now.alert = t(:logged_error)
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: t(:logged_out)
  end
end
