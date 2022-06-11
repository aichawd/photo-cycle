class PicturesController < ApplicationController
  def user_gallery
    @user = User.find_by(username: params[:username])
    @user_pictures = Picture.where(user: @user)
    # defining a picture variable for the New modal
    @picture = Picture.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    if @picture.save
      redirect_to gallery_path(current_user.username)
    else
      render :new
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:user, :caption, :photo)
  end
end
