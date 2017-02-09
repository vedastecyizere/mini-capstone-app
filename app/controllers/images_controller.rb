class ImagesController < ApplicationController

  def index 
    @images = Image.all
    return "index.html.erb"  
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.html.erb" 
  end

  
end
