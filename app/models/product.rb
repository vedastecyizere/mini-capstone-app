class Product < ApplicationRecord


  def tax 
    @tax = price*0.09
  end 
end
