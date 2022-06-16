class PicturesController < ApplicationController
  def user_gallery
    @user = User.find_by(username: params[:username])
    @user_pictures = Picture.where(user: @user)
    # defining a picture variable for the 'Add photo' modal
    @picture = Picture.new
    # defining a collab variable for the 'Propose collab' modal
    @collab = Collaboration.new
  end

  def user_feed
    @pictures = Picture.all
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
