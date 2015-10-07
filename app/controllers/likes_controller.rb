class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    if !current_user.nil?
      @image = Image.find(params[:image_id])
      @image.likes.create
      render json: {new_like_count: @image.likes.count}
    else
      flash[:notice] = 'You must be logged in to like images'
      redirect_to '/images'
    end
  end
end
