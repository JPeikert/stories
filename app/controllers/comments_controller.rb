class CommentsController < ApplicationController

  before_action :require_user

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.author = User.find(current_user).first_name
    @comment.author_id = current_user.id
    @comment.save
    redirect_to user_photo_path(user_id: @user.id, id: @photo.id)
  end

  def destroy
    if current_user.id == params[:user_id]
      @user = User.find(params[:user_id])
      @photo = @user.photos.find(params[:photo_id])
      @comment = @photo.comments.find(params[:id])
      @comment.destroy
      redirect_to user_photo_path(user_id: @user.id, id: @photo.id)
    else
      redirect_to users_path
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
