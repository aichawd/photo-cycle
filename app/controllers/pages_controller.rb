class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @pictures = Picture.all.sample(30)
  end
end
