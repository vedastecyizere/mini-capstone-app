class ProductsController < ApplicationController

  def index 
    @products = Product.all
    render "index.html.erb"
  end 

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end 

  def new
  end 

  def create
    name = params[:name]
    price = params[:price]
    discount = params[:discount]
    image = params[:image]
    product = Product.new({name: name, price: price, discount: discount, image: image})
    product.save
  end 

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.discount = params[:discount]
    @product.image = params[:image]
    @product.save
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    
  end
  
end
