class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  belongs_to :user, optional: true 
  has_many :category_products 
  has_many :categories, through: :category_products
  has_many :curted_products
  has_many :orders, through: :curted_products


  def tax 
    price * 0.09
  end 
  
end
