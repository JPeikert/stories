class PhotosController < ApplicationController
  
  before_action :require_user

  def show
    if User.exists?(params[:user_id])
      @user = User.find(params[:user_id])
      if @user.photos.exists?(params[:id])
        @photo = @user.photos.find(params[:id])
      else
        redirect_to users_path
      end
    else
      redirect_to users_path
    end
   
  end

  def new
    @user = User.find(session[:user_id])
    @photo = Photo.new(user: @user)
  end

  def create
    @user = User.find(session[:user_id])

    if @user.photos.create(photo_params)
      redirect_to user_path(id: session[:user_id])
    else
      render new_user_photo_path(user_id: session[:user_id])
    end
  end

  def edit
    @user = User.find_by_id(session[:user_id])
    if @user.photos.exists?(params[:id])
      @photo = @user.photos.find(params[:id])
    else
      redirect_to users_path
    end
  end
  
  def update
    @user = User.find_by_id(session[:user_id])
    if @user.photos.exists?(params[:id])
      @photo = @user.photos.find(params[:id])
      if @photo.update_attributes(photo_params)
        redirect_to user_photo_path(user_id: session[:user_id], id: @photo.id)
      else
        render edit_user_photo_path(user_id: session[:user_id], id: @photo.id)
      end
    else
      redirect_to users_path
    end
  end

  def destroy
    if current_user.id == User.find(params[:user_id]).id
      @user = User.find(params[:user_id])
      @photo = @user.photos.find(params[:id])
      @photo.destroy
      redirect_to user_path(@user)
    else
      redirect_to users_path
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:title, :description, :img)
    end
end
