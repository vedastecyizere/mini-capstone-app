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
    product = Product.new({name: name, price: price, discount: discount})
    product.save
  end 
end
