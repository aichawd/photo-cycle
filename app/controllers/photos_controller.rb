class PhotosController < ApplicationController
  def user_gallery
    @user = User.find_by(username: params[:username])
  end
end
