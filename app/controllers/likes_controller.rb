class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @image = Image.find(params[:image_id])
    @like = @image.likes.build({user_id: current_user.id})
    if !current_user.nil? && @like.save
      render json: {new_like_count: @image.likes.count}
    else
      flash[:notice] = 'You must be logged in to like images'
      redirect_to '/images'
    end
  end
end
