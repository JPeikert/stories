class PhotosController < ApplicationController
  
  before_action :require_user

  def show
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])
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


  private
    def photo_params
      params.require(:photo).permit(:title, :description, :img)
    end
end
