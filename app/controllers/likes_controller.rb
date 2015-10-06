class LikesController < ApplicationController

  def create
    if !current_user.nil?
      @image = Image.find(params[:image_id])
      @image.likes.create
      render json: {new_like_count: @image.likes.count}
    else
      flash[:notice] = 'You need to sign in to like an image'
      redirect_to '/images'
    end
  end

end
