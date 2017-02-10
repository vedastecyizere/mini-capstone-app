class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index 
    if params[:sort]
      @products = Product.all.order(price: params[:sort])
    elsif params[:filter] == "discount"
      @products = Product.discounted_products
    elsif params[:category]
      @products =  Category.find_by(name: params[:category]).products
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
    @suppliers = Supplier.all
    @product = Product.new
  end 

  def create
    product = Product.new({
      name: params[:name],
      price: params[:price],
      discount: params[:discount],
      suppler_id: params[:supplier_id]})
    if product.save
      flash[:success] = "New Item created"
      redirect_to "/product/#{product.id}"

    else
      @suppliers = Supplier.all
      flash[:warning] = "Product NOT Created"
      render :new
    end 
  end 


  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes({
      name: params[:name],
      price: params[:price],
      discount: params[:discount],
      supplier_id: params[:supplier_id]
    })
    if product.save
      flash[:info] = "Item list updated"
      redirect_to "/products/#{product.id}"
    else 
      @suppliers = Supplier.all
      render :edit
    end 
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Your Item has been deleted" 
    redirect_to "/products/"
      
  end

  def search 
    search_query = params[:search_input]
    @products = Product.where("name LIKE ? OR discount LIKE ?", "%#{search_query}%","%#{search_query}%")

    if @products.empty?
      flash[:info] = "No product found"
    end 
    render :index
  end 
  
  
end
