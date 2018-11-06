class ImagesController < ApplicationController
  def new
    @image = Image.new
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

  private

  def image_params
    params.require(:image).permit(:url)
  end
end
