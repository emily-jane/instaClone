class ImagesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @images = Image.all
  end

  def new
    @image = current_user.images.new
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      redirect_to '/images'
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if !current_user.nil? && current_user.id == @image.user_id
      @image.update(image_params)
      redirect_to '/images'
    else
      flash[:notice] = 'You cannot edit an image you did not create'
      redirect_to '/images'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if !current_user.nil? && current_user.id == @image.user_id
      @image.destroy
      flash[:notice] = 'Image deleted successfully'
      redirect_to '/images'
    else
      flash[:notice] = 'You cannot delete an image you did not create'
      redirect_to '/images'
    end
  end

  def image_params
    params.require(:image).permit(:name, :image)
  end

end
