class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images


  def tax 
    price * 0.09
  end 
  
end
