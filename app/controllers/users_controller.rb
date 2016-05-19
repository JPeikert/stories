class UsersController < ApplicationController
  before_action :require_user, only: [:index, :show, :edit, :update]
  before_action :require_logout, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by_id(session[:user_id])
  end
  
  def update
    @user = User.find_by_id(session[:user_id])
    
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render edit_user_path(id: session[:user_id])
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
    end
end
