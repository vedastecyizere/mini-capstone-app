class Product < ApplicationRecord
  belongs_to :supplier


  def tax 
    price * 0.09
  end 
  
end
