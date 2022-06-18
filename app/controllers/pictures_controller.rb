class PicturesController < ApplicationController
  def user_gallery
    @user = User.find_by(username: params[:username])
    @users = User.all
    #(current_user)
    @chatroom = Chatroom.new

    @single_chatroom = Chatroom.find_by(first_user: current_user, second_user: @user) || Chatroom.find_by(first_user: @user, second_user: current_user) || Chatroom.create_private_chatroom(@user, current_user)
    @message= Message.new
    @messages = @single_chatroom.messages.order(created_at: :asc)
    @user_pictures = Picture.where(user: @user).where(collaboration_id: nil)
    # defining a picture variable for the 'Add photo' modal
    @picture = Picture.new
    # defining a collab variable for the 'Propose collab' modal
    @collab = Collaboration.new
  end

  def user_feed
    @pictures = Picture.all.includes(photo_categories: :category)
    if params[:query]
      @pictures = @pictures.joins(:photo_categories, :categories).where('categories.name ILIKE ?', "%#{params[:query]}%")
    end
    respond_to do |format|
      html = render_to_string partial: 'pictures/user_feed_photos', locals: { pictures: @pictures }, format: [:html], layout: false
      format.json {
        render json: {
          html: html
        }
      }
      format.html
    end
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

  def get_name(user1, user2)
    user = [user1, user2]
    "conversation privée_#{user[0].id}_#{user[1].id},"
  end

  def picture_params
    params.require(:picture).permit(:user, :caption, :photo, :collaboration_id)
  end
end
