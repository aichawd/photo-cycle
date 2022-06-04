class PicturesController < ApplicationController
  def user_gallery
    @user = User.find_by(username: params[:username])
    @user_pictures = Picture.where(user: @user)
  end
end
