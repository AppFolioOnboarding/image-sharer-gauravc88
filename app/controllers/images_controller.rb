class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @images = Image.order('created_at DESC')
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = 'Image saved'
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:url, :tag_list)
  end
end
