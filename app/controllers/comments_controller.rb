class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find review_params[:image_id]
    @comment = @image.build_comment current_user, comment_params

    if @comment.save
      redirect_to images_path
    else
      if @comment.errors[:user]
        redirect_to image_path, alert: 'You have already commented on this image'
      else
        render :new
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

end
