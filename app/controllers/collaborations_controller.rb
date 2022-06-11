class CollaborationsController < ApplicationController
  before_action :set_collab, only: [:show]

  def new
    @collab = Collaboration.new
  end

  def create
    @collab = Collaboration.new(collab_params)
    @collab.artist1 = current_user
    @receiver = User.find_by(username: params[:artist2])
    @collab.artist2 = @receiver
    if @collab.save
      redirect_to gallery_path(@receiver.username), notice: "Collaboration request sent"
    else
      render :new
    end
  end

  def show
    @collab_pictures = Picture.where(collaboration_id: @collab.id)
    @artist1 = User.find(@collab.artist1_id)
    @artist2 = User.find(@collab.artist2_id)
  end

  private

  def set_collab
    @collab = Collaboration.find(params[:id])
  end

  def collab_params
    params.require(:collaboration).permit(:name, :status, :artist1_id, :artist2_id)
  end
end
