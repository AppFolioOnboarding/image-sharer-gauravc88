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

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to @image
    else
      render 'edit', status: :unprocessable_entity
    end
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

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
