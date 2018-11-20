class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @images = if params[:tag].blank?
                Image.order('created_at DESC')
              else
                Image.order('created_at DESC').tagged_with(params[:tag])
              end
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = 'Image saved'
      redirect_to @image
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    begin
      Image.destroy(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = 'Image delete failed'
    else
      flash[:notice] = 'Image deleted'
    end
    redirect_to images_path
  end

  def share
    @image = Image.find(params[:id])
    @sharing = ShareImage.new(image_id: @image.id)
  end

  def shared
    share_params = share_image_params
    @sharing = ShareImage.new(share_params)
    @image = Image.find(share_params[:image_id])
    if @sharing.valid? && @image.valid?
      flash[:success] = 'Image shared'
      redirect_to images_path
    else
      flash[:error] = 'Image share failed'
      render 'share', status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end

  def share_image_params
    params.require(:share_image).permit(:image_id, :email_recipients, :email_message)
  end
end
