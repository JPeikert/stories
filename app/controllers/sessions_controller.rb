class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  before_action :require_logout, only: [:new, :create]
  
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
