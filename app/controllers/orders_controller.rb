class OrdersController < ApplicationController

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    @order = Order.find_by(id: params[:id])
    subtotal = quantity * product.price 
    tax = quantity * product.tax
    total = subtotal + tax 
    order = Order.new(user_id: current_user.id, quantity: quantity, product_id: product.id, subtotal: subtotal, tax: tax, total: total)
    if order.save
      flash[:success] ="Order Created"
      redirect_to "/orders/#{order.id}"
    else 
      flash[:danger] = "order not Created"
      redirect_to "/product/#{product.id}"
    end 
  end 

  def show
    @order = Order.find_by(id: params[:id])
  end
    total_total = total_tax + total_subtotal
    order.assign_attributes(tax: total_tax, subtotal: total_subtotal, total: total_total, completed: true)
    order.save
    redirect_to "/orders/#{order.id}"
  end 
end
