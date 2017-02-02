class ProductsController < ApplicationController

  def index 
    if params[:sort]
      @products = Product.all.order(price: params[:sort])
    elsif params[:filter]
      @products = Product.where("price > ?", 100000) 
    else
      @products = Product.all
    end  
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else 
      @product = Product.find_by(id: params[:id])
    end 
  end 

  def new
  end 

  def create
    price = params[:price]
    discount = params[:discount]
    image = params[:image]
    product = Product.new({name: params[:name], price: price, discount: discount, image: image})
    product.save
    flash[:info] = "New item created"
    redirect_to "/products/#{product.id}"
  end 

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.discount = params[:discount]
    product.image = params[:image]
    product.save
    flash[:info] = "Item list updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    redirect_to "/products/"
    flash[:info] = "Your Item has been deleted"   
  end

  def search 
    search_query = params[:search_input]
    @products = Product.where("name ILIKE ? OR discount ILIKE ?", "%#{search_query}%","%#{search_query}%")

    if @products.empty?
      flash[:info] = "No result found"
    end 
    render :index
  end 
  
  
end
