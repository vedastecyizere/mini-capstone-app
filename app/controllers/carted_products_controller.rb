class CartedProductsController < ApplicationController
 
  def index 
   orders = Order.where("user_id=? AND completed=?", current_user.id, false)
   @carts = CartedProduct.where(order_id: orders.first.id)
  end 

 def create
  order = current_user.orders.find_by(completed:false) || Order.new(user_id:current_user.id, completed: false)
  orders = Order.where("user_id = ? AND completed =?", current_user.id, false)

  carted_product = CartedProduct.new(quantity: params[:quantity], product_id: params[:product_id],order_id:order.id)
  carted_product.save 
  redirect_to "/carted_products"
  end 
end