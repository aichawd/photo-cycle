class CollaborationsController < ApplicationController
  before_action :set_collab, only: [:show]

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
    params.require(:collaboration).permit(:name, :status)
  end
end
